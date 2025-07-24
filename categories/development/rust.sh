#!/bin/bash

# Rust Programming Language Installation Script
# This script installs Rust using rustup

set -e

echo "Installing Rust Programming Language..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl build-essential

# Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source the cargo environment
source ~/.cargo/env

# Add cargo to PATH in bashrc
echo 'source ~/.cargo/env' >> ~/.bashrc

# Install additional components
rustup component add rustfmt
rustup component add clippy
rustup component add rust-analyzer

# Install useful Rust tools
cargo install cargo-watch
cargo install cargo-edit
cargo install cargo-tree
cargo install cargo-audit

# Verify installation
rustc --version
cargo --version

echo "Rust Programming Language installed successfully!"
echo "Rust version: $(rustc --version)"
echo "Cargo version: $(cargo --version)"
echo "Installed components: rustfmt, clippy, rust-analyzer"
echo "Installed tools: cargo-watch, cargo-edit, cargo-tree, cargo-audit"
echo "Please restart your terminal or run 'source ~/.bashrc' to update environment variables"
