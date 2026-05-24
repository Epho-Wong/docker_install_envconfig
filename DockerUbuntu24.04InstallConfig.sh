#!/bin/bash

set -e

echo " start to configure env for installing docker"

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg|sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable"|sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce=5:27.5.1-1~ubuntu.24.04~noble docker-ce-cli=5:27.5.1-1~ubuntu.24.04~noble containerd.io docker-compose-plugin docker-buildx-plugin

sudo docker info

docker --version

sudo usermod -aG docker $USER

echo "done"
