#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting deployment..."

# Navigate to the deployment directory
cd /var/www/angular-app || exit

# Install dependencies
echo "Installing dependencies..."
npm install --legacy-peer-deps

# Build the Angular application
echo "Building Angular application..."
ng build --configuration=production

# Serve the Angular app using a lightweight HTTP server (adjust if needed)
echo "Starting Angular application..."
nohup npx http-server -p 80 dist/ecommerce/ &

echo "Deployment complete!"
