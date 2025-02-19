#!/bin/bash
set -e  # Exit on error

echo " Cleaning up old deployment files..."

# Ensure all files, including hidden ones like `.git`, are removed
sudo rm -rf /var/www/html/angular-app/*  
sudo rm -rf /var/www/html/angular-app/.* || true  

# Recreate the directory to ensure it exists after deletion
sudo mkdir -p /var/www/html/angular-app
sudo chown ubuntu:ubuntu /var/www/html/angular-app
sudo chmod 755 /var/www/html/angular-app

echo " Cleanup complete!"

