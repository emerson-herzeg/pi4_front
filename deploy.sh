#!/bin/bash

# Function to check if the server is available for SSH connection
check_ssh_connection() {
  local ip="$1"
  local key="$2"
  local user="$3"
  for i in {1..10}; do
    if ssh -q -o StrictHostKeyChecking=no -o ConnectTimeout=5 -i "$key" "$user"@"$ip" exit; then
      return 0
    else
      echo "SSH connection attempt $i failed. Retrying in 5 seconds..."
      sleep 5
    fi
  done
  return 1
}

# Replace these variables with your own values
INSTANCE_ID="i-001eb466cefd46179"
USER="ubuntu"
REPO="https://github.com/emerson-herzeg/pi4_front"
BRANCH="master"
CODE_DIR="/home/ubuntu/apps/pi4/front"
REGION="us-east-1" # Replace this with your instance's region

# Stop the instance
aws ec2 stop-instances --region $REGION --instance-ids $INSTANCE_ID

# Check instance state and wait for it to be 'stopped'
echo "Checking instance state..."
instance_state=$(aws ec2 describe-instances --region $REGION --instance-ids $INSTANCE_ID --query 'Reservations[*].Instances[*].State.Name' --output text)

while [ "$instance_state" != "stopped" ]; do
  echo "Instance is in $instance_state state. Waiting for it to be 'stopped'..."
  sleep 10
  instance_state=$(aws ec2 describe-instances --region $REGION --instance-ids $INSTANCE_ID --query 'Reservations[*].Instances[*].State.Name' --output text)
done

echo "Instance is stopped. Proceeding with instance type modification..."

# Modify instance type
aws ec2 modify-instance-attribute --region $REGION --instance-id $INSTANCE_ID --instance-type "{\"Value\": \"t2.small\"}"

# Start the instance
aws ec2 start-instances --region $REGION --instance-ids $INSTANCE_ID

# Wait for the instance to be in a running state
aws ec2 wait instance-running --region $REGION --instance-ids $INSTANCE_ID

# Get the instance public IP
INSTANCE_PUBLIC_IP=$(aws ec2 describe-instances --region $REGION --instance-ids $INSTANCE_ID --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

# Deploy the latest code
if check_ssh_connection "$INSTANCE_PUBLIC_IP" "herzeg.pem" "$USER"; then
ssh -o StrictHostKeyChecking=no -i herzeg.pem $USER@$INSTANCE_PUBLIC_IP "bash -s" <<ENDSSH
  export REPO="$REPO"
  export BRANCH="$BRANCH"
  export CODE_DIR="$CODE_DIR"

  # Update the repository
  if [ ! -d "\$CODE_DIR" ]; then
    git clone \$REPO \$CODE_DIR
  else
    (
      cd \$CODE_DIR
      git fetch
      git checkout \$BRANCH
      git pull origin \$BRANCH
      git reset --hard origin/\$BRANCH
    )
  fi

  cd \$CODE_DIR
  npm install
  npm run build:prod
  sudo cp -r dist/* /var/www/html/pi4
ENDSSH
fi

# Stop the instance
aws ec2 stop-instances --region $REGION --instance-ids $INSTANCE_ID

# Wait for the instance to be in a stopped state
aws ec2 wait instance-stopped --region $REGION --instance-ids $INSTANCE_ID

# Modify instance type back to t2.micro
aws ec2 modify-instance-attribute --region $REGION --instance-id $INSTANCE_ID --instance-type "{\"Value\": \"t2.micro\"}"

# Start the instance
aws ec2 start-instances --region $REGION --instance-ids $INSTANCE_ID

# Wait for the instance to be in a running state
aws ec2 wait instance-running --region $REGION --instance-ids $INSTANCE_ID
