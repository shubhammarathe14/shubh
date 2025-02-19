#!/bin/bash
set -e  # Exit on error

echo "🚀 Cleaning up old deployment files..."

# Ensure the deployment directory exists before removing old files
if [ -d "/var/www/html/angular-app" ]; then
    sudo rm -rf /var/www/html/angular-app/*
    sudo rm -rf /var/www/html/angular-app/.* 2>/dev/null || true
fi

# Recreate the directory with proper permissions
sudo mkdir -p /var/www/html/angular-app
sudo chown ubuntu:ubuntu /var/www/html/angular-app
sudo chmod 755 /var/www/html/angular-app

echo "✅ Cleanup complete!"

