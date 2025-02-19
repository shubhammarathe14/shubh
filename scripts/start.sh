#!/bin/bash
set -e

echo "Starting deployment..."

# Ensure deployment directory exists
sudo mkdir -p /var/www/angular-app
sudo chown -R ubuntu:ubuntu /var/www/angular-app

# Copy deployment files to the correct directory
echo "Copying application files..."
cp -r * /var/www/angular-app/

# Navigate to the deployment directory
cd /var/www/angular-app || exit

# Check if package.json exists
if [ ! -f package.json ]; then
  echo "Error: package.json not found in /var/www/angular-app!"
  exit 1
fi

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





