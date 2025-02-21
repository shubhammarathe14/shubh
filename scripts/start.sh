# #!/bin/bash
# set -e  # Exit if any command fails

# # Find the most recent deployment directory
# DEPLOYMENT_DIR=$(ls -td /opt/codedeploy-agent/deployment-root/d-* | head -1)/deployment-archive
# TARGET_DIR="/var/www/html/angular-app"

# echo "🚀 Starting deployment..."
# echo "📂 Checking deployment directory..."

# # Ensure the deployment archive exists before proceeding
# if [ ! -d "$DEPLOYMENT_DIR" ]; then
#     echo "❌ Deployment archive not found at $DEPLOYMENT_DIR"
#     exit 1
# fi

# echo "📂 Deployment archive found. Copying files..."

# # Ensure the target directory exists and has proper permissions
# sudo mkdir -p "$TARGET_DIR"
# sudo chown -R ubuntu:ubuntu "$TARGET_DIR"
# sudo chmod -R 755 "$TARGET_DIR"

# # Copy files from the archive to the target directory
# sudo rsync -av --delete "$DEPLOYMENT_DIR/" "$TARGET_DIR/"

# echo "✅ Deployment completed successfully!"

set -e  # Exit immediately if a command fails

DEPLOYMENT_BASE="/opt/codedeploy-agent/deployment-root/"
echo "🔍 Searching for deployment-archive in $DEPLOYMENT_BASE"

# Find the latest deployment archive path dynamically
DEPLOYMENT_DIR=$(find "$DEPLOYMENT_BASE" -type d -name "deployment-archive" | tail -n 1)

# Debugging: Log found deployment directories
echo "📝 Found deployment directories:"
find "$DEPLOYMENT_BASE" -type d -name "deployment-archive"

if [ -z "$DEPLOYMENT_DIR" ]; then
    echo "❌ Deployment archive directory not found in $DEPLOYMENT_BASE"
    exit 1
fi

TARGET_DIR="/var/www/html/angular-app"

echo "🚀 Starting deployment..."
echo "📂 Deployment directory found: $DEPLOYMENT_DIR"

# Ensure the target directory exists and has proper permissions
sudo mkdir -p "$TARGET_DIR"
sudo chown -R ubuntu:ubuntu "$TARGET_DIR"
sudo chmod -R 755 "$TARGET_DIR"

# Copy files from the archive to the target directory
sudo rsync -av --delete "$DEPLOYMENT_DIR/" "$TARGET_DIR/"

echo "🔄 Restarting Nginx..."
sudo systemctl restart nginx

echo "✅ Deployment completed successfully!"








