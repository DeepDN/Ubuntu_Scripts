#!/bin/bash

# Python Development Environment Installation Script
# This script installs Python, pip, and essential development tools

set -e

echo "Installing Python development environment..."

# Update package list
sudo apt update

# Install Python and pip
sudo apt install -y python3 python3-pip python3-venv python3-dev

# Install build essentials for compiling packages
sudo apt install -y build-essential libssl-dev libffi-dev

# Install Python package management tools
pip3 install --user --upgrade pip
pip3 install --user pipenv poetry

# Install common Python development packages
pip3 install --user virtualenv virtualenvwrapper
pip3 install --user jupyter notebook jupyterlab
pip3 install --user requests beautifulsoup4 pandas numpy matplotlib
pip3 install --user flask django fastapi
pip3 install --user pytest black flake8 mypy
pip3 install --user autopep8 isort

# Install IPython for better interactive shell
pip3 install --user ipython

# Create symbolic links for easier access
sudo ln -sf /usr/bin/python3 /usr/local/bin/python
sudo ln -sf /usr/bin/pip3 /usr/local/bin/pip

# Verify installation
echo "Python version: $(python3 --version)"
echo "Pip version: $(pip3 --version)"

echo "Python development environment installed successfully!"
echo "Installed packages: Jupyter, Flask, Django, FastAPI, pytest, black, flake8, and more"
echo "Use 'python3 -m venv myenv' to create virtual environments"
