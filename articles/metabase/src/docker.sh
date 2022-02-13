#!/bin/bash

#
# Uninstall old versions of docker
# Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:
# 

sudo apt-get remove -y docker docker-engine docker.io containerd runc

#
# Set up the respository 
# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
#
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#
# Add Docker’s official GPG key:
#    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#
# Use the following command to set up the stable repository. 
# To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below.
#
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#
# Install Docker Engine
# Update the apt package index, and install the latest version of Docker Engine and containerd, 
# or go to the next step to install a specific version:
#  
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#
# To install a specific version of Docker Engine, list the available versions in the repo, then select and install:
# a. List the versions available in your repo:
#
apt-cache madison docker-ce

#
# Verify that Docker Engine is installed correctly by running the hello-world image.
# 
sudo docker run hello-world