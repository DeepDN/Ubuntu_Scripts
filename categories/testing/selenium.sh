#!/bin/bash

# Selenium WebDriver Installation Script
# This script installs Selenium WebDriver and browser drivers

set -e

echo "Installing Selenium WebDriver..."

# Update package list
sudo apt update

# Install Python and pip
sudo apt install -y python3 python3-pip

# Install Selenium for Python
pip3 install --user selenium

# Install additional testing libraries
pip3 install --user pytest pytest-selenium webdriver-manager

# Install Node.js Selenium (if Node.js is available)
if command -v npm &> /dev/null; then
    npm install -g selenium-webdriver
fi

# Install browser drivers
sudo apt install -y wget unzip

# Install ChromeDriver
CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+')
CHROMEDRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_VERSION%.*}")
wget -O /tmp/chromedriver.zip "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
sudo unzip /tmp/chromedriver.zip -d /usr/local/bin/
sudo chmod +x /usr/local/bin/chromedriver

# Install GeckoDriver (Firefox)
GECKO_VERSION=$(curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep -oP '"tag_name": "v\K(.*)(?=")')
wget -O /tmp/geckodriver.tar.gz "https://github.com/mozilla/geckodriver/releases/download/v${GECKO_VERSION}/geckodriver-v${GECKO_VERSION}-linux64.tar.gz"
sudo tar -xzf /tmp/geckodriver.tar.gz -C /usr/local/bin/
sudo chmod +x /usr/local/bin/geckodriver

# Create a sample Selenium test
mkdir -p ~/selenium-tests
cat > ~/selenium-tests/test_example.py << 'EOF'
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def test_google_search():
    # Setup Chrome driver
    driver = webdriver.Chrome()
    
    try:
        # Navigate to Google
        driver.get("https://www.google.com")
        
        # Find search box and enter query
        search_box = driver.find_element(By.NAME, "q")
        search_box.send_keys("Selenium WebDriver")
        search_box.submit()
        
        # Wait for results
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.ID, "search"))
        )
        
        print("Test passed: Google search completed successfully")
        
    finally:
        driver.quit()

if __name__ == "__main__":
    test_google_search()
EOF

# Clean up
rm -f /tmp/chromedriver.zip /tmp/geckodriver.tar.gz

echo "Selenium WebDriver installed successfully!"
echo "Installed components:"
echo "  - Selenium Python library"
echo "  - ChromeDriver version: ${CHROMEDRIVER_VERSION}"
echo "  - GeckoDriver version: ${GECKO_VERSION}"
echo "  - pytest and pytest-selenium"
echo "Sample test created at: ~/selenium-tests/test_example.py"
echo "Run the sample test: cd ~/selenium-tests && python3 test_example.py"
