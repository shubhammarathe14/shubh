#!/bin/bash
set -e

echo "Cleaning up old deployment files..."
rm -rf /var/www/html/angular-app/*
echo "Cleanup complete!"
