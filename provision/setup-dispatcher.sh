#!/bin/bash

echo "Provisioning virtual machine..."
# Update
sudo apt-get update > /dev/null
echo "set Locale"
sudo locale-gen en_US en_US.UTF-8
sudo dpkg-reconfigure locales
echo "Updating"
# APACHE
echo "Installing apache"
sudo apt-get install -y apache2 > /dev/null

echo "Finished provisioning."