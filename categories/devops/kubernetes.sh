#!/bin/bash

# Kubernetes Tools Installation Script
# This script installs kubectl, minikube, and related tools

set -e

echo "Installing Kubernetes tools..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl apt-transport-https

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Install Helm
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt update
sudo apt install -y helm

# Install k9s (Kubernetes CLI management tool)
K9S_VERSION=$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep -oP '"tag_name": "v\K(.*)(?=")')
curl -LO https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_amd64.tar.gz
tar -xzf k9s_Linux_amd64.tar.gz
sudo mv k9s /usr/local/bin/

# Clean up
rm -f kubectl minikube-linux-amd64 k9s_Linux_amd64.tar.gz

# Verify installations
kubectl version --client
minikube version
helm version
k9s version

echo "Kubernetes tools installed successfully!"
echo "kubectl: Kubernetes command-line tool"
echo "minikube: Local Kubernetes cluster"
echo "helm: Kubernetes package manager"
echo "k9s: Terminal UI for Kubernetes"
echo "Start minikube: minikube start"
