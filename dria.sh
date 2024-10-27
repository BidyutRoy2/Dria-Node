#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/BidyutRoy2/BidyutRoy2/main/logo.sh | bash
echo "-----------------------------------------------------------------------------"

# Exit immediately if a command exits with a non-zero status
set -e

# Step 1: Install Docker
echo "Updating system and installing Docker..."
sudo apt update -y && sudo apt upgrade -y

# Install prerequisites
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Set up the Docker GPG key and repository
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Final update and installation of Docker
sudo apt update -y && sudo apt upgrade -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo chmod +x /usr/local/bin/docker-compose

# Check Docker version
echo "Docker installation complete. Checking version..."
docker --version

# Step 2: Install Ollama
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Step 3: Change to the home directory
cd $HOME

# Step 4: Download the dkn-compute-node
echo "Downloading dkn-compute-node..."
curl -L -o dkn-compute-node.zip https://github.com/firstbatchxyz/dkn-compute-launcher/releases/latest/download/dkn-compute-launcher-linux-amd64.zip

# Step 5: Unzip the downloaded file
echo "Unzipping dkn-compute-node..."
unzip dkn-compute-node.zip

# Step 6: Change to the dkn-compute-node directory
cd dkn-compute-node

# Step 7: Run the dkn-compute-launcher
echo "Starting dkn-compute-launcher..."
./dkn-compute-launcher

echo "Setup is complete."
