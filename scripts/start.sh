#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting deployment..."

# Create the directory with proper permissions
sudo mkdir -p /var/www/angular-app
sudo chown -R $USER:$USER /var/www/angular-app

# Navigate to the deployment directory
cd /var/www/angular-app || exit

# Install dependencies
echo "Installing dependencies..."
sudo npm install --legacy-peer-deps

# Build the Angular application
echo "Building Angular application..."
sudo ng build --configuration=production

# Serve the Angular app
echo "Starting Angular application..."
nohup npx http-server -p 80 dist/ecommerce/ &

echo "Deployment complete!"


