#!/bin/bash
set -e  # Exit on error

echo "Starting deployment..."

# Ensure directory exists with correct permissions
sudo mkdir -p /var/www/angular-app
sudo chown -R ubuntu:ubuntu /var/www/angular-app
sudo chmod -R 755 /var/www/angular-app

echo "Copying application files..."
rsync -av --exclude='.git' --exclude='node_modules' /opt/codedeploy-agent/deployment-root/latest/deployment-archive/ /var/www/angular-app/

echo "Installing dependencies..."
cd /var/www/angular-app
npm install --legacy-peer-deps

echo "Building Angular application..."
ng build --configuration=production

echo "Starting Angular application..."
nohup npx http-server -p 80 dist/ecommerce/ &

echo "Deployment complete!"






