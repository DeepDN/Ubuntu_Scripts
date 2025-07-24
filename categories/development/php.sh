#!/bin/bash

# PHP Development Environment Installation Script
# This script installs PHP and related development tools

set -e

echo "Installing PHP development environment..."

# Update package list
sudo apt update

# Install PHP and common extensions
sudo apt install -y php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath

# Install Composer (PHP package manager)
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

# Install additional PHP development tools
sudo apt install -y php-dev php-xdebug

# Install Laravel installer
composer global require laravel/installer

# Install Symfony CLI
curl -sS https://get.symfony.com/cli/installer | bash
sudo mv ~/.symfony*/bin/symfony /usr/local/bin/symfony

# Add Composer global bin to PATH
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

# Install PHPUnit
composer global require phpunit/phpunit

# Install PHP CodeSniffer
composer global require squizlabs/php_codesniffer

# Verify installation
php --version
composer --version

echo "PHP development environment installed successfully!"
echo "PHP version: $(php --version | head -n 1)"
echo "Composer version: $(composer --version)"
echo "Installed tools: Laravel installer, Symfony CLI, PHPUnit, PHP CodeSniffer"
echo "Please restart your terminal or run 'source ~/.bashrc' to update PATH"
