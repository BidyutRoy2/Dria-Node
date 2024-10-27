#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/BidyutRoy2/BidyutRoy2/main/logo.sh | bash
echo "-----------------------------------------------------------------------------"

# Exit immediately if a command exits with a non-zero status
set -e

# Step 1: Install Ollama
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Step 2: Change to the home directory
cd $HOME

# Step 3: Download the dkn-compute-node
echo "Downloading dkn-compute-node..."
curl -L -o dkn-compute-node.zip https://github.com/firstbatchxyz/dkn-compute-launcher/releases/latest/download/dkn-compute-launcher-linux-amd64.zip

# Step 4: Unzip the downloaded file
echo "Unzipping dkn-compute-node..."
unzip dkn-compute-node.zip

# Step 5: Change to the dkn-compute-node directory
cd dkn-compute-node

# Step 6: Run the dkn-compute-launcher
echo "Starting dkn-compute-launcher..."
./dkn-compute-launcher

echo "Setup is complete."
