#!/bin/bash

# Cypress End-to-End Testing Installation Script
# This script installs Cypress testing framework

set -e

echo "Installing Cypress..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is required but not installed. Installing Node.js first..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Update package list
sudo apt update

# Install dependencies for Cypress
sudo apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

# Create a test project directory
mkdir -p ~/cypress-test-project
cd ~/cypress-test-project

# Initialize npm project
npm init -y

# Install Cypress
npm install --save-dev cypress

# Install additional testing utilities
npm install --save-dev @cypress/code-coverage
npm install --save-dev cypress-multi-reporters
npm install --save-dev mochawesome mochawesome-merge mochawesome-report-generator

# Create basic Cypress configuration
cat > cypress.config.js << EOF
const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: 'http://localhost:3000',
    supportFile: 'cypress/support/e2e.js',
    specPattern: 'cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
    video: true,
    screenshotOnRunFailure: true,
  },
})
EOF

# Create a sample test
mkdir -p cypress/e2e
cat > cypress/e2e/sample.cy.js << EOF
describe('Sample Test', () => {
  it('should visit a page', () => {
    cy.visit('https://example.com')
    cy.contains('Example Domain')
  })
})
EOF

# Add npm scripts
npm pkg set scripts.cypress:open="cypress open"
npm pkg set scripts.cypress:run="cypress run"

echo "Cypress installed successfully!"
echo "Project created at: ~/cypress-test-project"
echo "To open Cypress: cd ~/cypress-test-project && npm run cypress:open"
echo "To run tests headlessly: cd ~/cypress-test-project && npm run cypress:run"
