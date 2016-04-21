#!/bin/bash

echo "Provisioning virtual machine..."
# Update
echo "Updating"
sudo apt-get update > /dev/null
# APACHE
echo "Installing apache"
sudo apt-get install -y apache2 > /dev/null

echo "Finished provisioning."