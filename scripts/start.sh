#!/bin/bash
set -e

echo "Starting deployment..."

# Ensure /var/www/angular-app exists
sudo mkdir -p /var/www/angular-app
sudo chown -R $USER:$USER /var/www/angular-app

# Navigate to the deployment directory
cd /var/www/angular-app || exit

# Install dependencies using full path
echo "Installing dependencies..."
/usr/bin/npm install --legacy-peer-deps

# Build the Angular application
echo "Building Angular application..."
/usr/bin/ng build --configuration=production

# Serve the Angular app
echo "Starting Angular application..."
nohup npx http-server -p 80 dist/ecommerce/ &

echo "Deployment complete!"



