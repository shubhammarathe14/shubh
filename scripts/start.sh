#!/bin/bash
set -e

echo "Starting deployment..."

# Ensure /var/www/angular-app exists
sudo mkdir -p /var/www/angular-app
sudo chown -R ubuntu:ubuntu /var/www/angular-app

# Navigate to the deployment directory
cd /var/www/angular-app || exit

# Install dependencies
echo "Installing dependencies..."
npm install --legacy-peer-deps

# Build the Angular application
echo "Building Angular application..."
npx ng build --configuration=production

# Serve the Angular app
echo "Starting Angular application..."
nohup npx http-server -p 80 dist/ecommerce/ &

echo "Deployment complete!"




