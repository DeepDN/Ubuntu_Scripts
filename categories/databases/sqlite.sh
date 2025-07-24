#!/bin/bash

# SQLite Installation Script
# This script installs SQLite database and tools

set -e

echo "Installing SQLite..."

# Update package list
sudo apt update

# Install SQLite
sudo apt install -y sqlite3

# Install SQLite browser (GUI)
sudo apt install -y sqlitebrowser

# Install development libraries
sudo apt install -y libsqlite3-dev

echo "SQLite installed successfully!"
echo "SQLite version: $(sqlite3 --version)"
echo "Command line: sqlite3"
echo "GUI browser: sqlitebrowser"
echo "SQLite is a lightweight, serverless database engine"
