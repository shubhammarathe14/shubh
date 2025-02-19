#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting deployment..."

# Ensure deployment directory exists
mkdir -p /var/www/angular-app
cd /var/www/angular-app || exit

# Install dependencies
if [ -f "package.json" ]; then
    echo "Installing dependencies..."
    npm install --legacy-peer-deps
else
    echo "Error: package.json not found!"
    exit 1
fi

# Ensure Angular CLI is installed
if ! command -v ng &> /dev/null; then
    echo "Installing Angular CLI..."
    npm install -g @angular/cli@15.2.6
fi

# Build the Angular application
echo "Building Angular application..."
ng build --configuration=production

# Ensure build directory exists
if [ ! -d "./dist/ecommerce/" ]; then
    echo "Error: Build directory not found!"
    exit 1
fi

# Serve the Angular app using a lightweight HTTP server
echo "Starting Angular application..."
nohup npx http-server -p 80 ./dist/ecommerce/ > /dev/null 2>&1 &

echo "Deployment complete!"
