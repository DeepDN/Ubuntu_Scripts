#!/bin/bash

# Go Programming Language Installation Script
# This script installs the latest version of Go

set -e

echo "Installing Go Programming Language..."

# Get the latest Go version
GO_VERSION=$(curl -s https://api.github.com/repos/golang/go/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
GO_VERSION=${GO_VERSION#go}

# Download and install Go
cd /tmp
wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz

# Remove any previous Go installation and extract new one
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

# Set up Go environment variables
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

# Create Go workspace
mkdir -p $HOME/go/{bin,src,pkg}

# Source the bashrc to use Go immediately
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Install useful Go tools
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Clean up
rm -f /tmp/go${GO_VERSION}.linux-amd64.tar.gz

# Verify installation
go version

echo "Go Programming Language installed successfully!"
echo "Go version: $(go version)"
echo "GOROOT: /usr/local/go"
echo "GOPATH: $HOME/go"
echo "Please restart your terminal or run 'source ~/.bashrc' to update environment variables"
