#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Install Miniconda
echo "Downloading Miniconda installer"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

echo "Installing Miniconda"
bash miniconda.sh -b -p $HOME/miniconda

# Initialize conda
echo "Initializing Conda"
eval "$($HOME/miniconda/bin/conda shell.bash hook)"

# Update conda
echo "Updating Conda"
conda update -y conda

# Create a new conda environment with Python 3.7.10
echo "Creating Conda environment"
conda create -n books python=3.7.10 -y

# Activate the new conda environment
echo "Activating Conda environment"
conda activate books

# Install dependencies
echo "Installing dependencies"
pip install -r requirements.txt

# Run the Streamlit app
echo "Running Streamlit app"
streamlit run app.py --server.port $PORT