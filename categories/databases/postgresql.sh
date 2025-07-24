#!/bin/bash

# PostgreSQL and pgAdmin Installation Script
# This script installs PostgreSQL database server and pgAdmin web interface

set -e

echo "Installing PostgreSQL and pgAdmin..."

# Update package list
sudo apt update

# Install PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Start and enable PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Create a database user
echo "Setting up PostgreSQL user..."
sudo -u postgres createuser --interactive --pwprompt

# Install pgAdmin4
sudo apt install -y curl ca-certificates gnupg
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

sudo apt update
sudo apt install -y pgadmin4

# Configure pgAdmin
sudo /usr/pgadmin4/bin/setup-web.sh

# Install additional PostgreSQL tools
sudo apt install -y postgresql-client-common postgresql-client

# Show PostgreSQL status
sudo systemctl status postgresql --no-pager

echo "PostgreSQL and pgAdmin installed successfully!"
echo "PostgreSQL is running on port 5432"
echo "You can access pgAdmin at http://localhost/pgadmin4"
echo "Use 'sudo -u postgres psql' to access PostgreSQL command line"
