#!/bin/bash

echo "Preparing..."
apt-get update && apt-get install -y curl

# install docker using the convenience script
echo "Installing Docker..."
sh -c "$(curl -fsSL https://get.docker.com)"

# install docker-compose
echo "Installing Docker Compose..."
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# build & run the container
echo "Starting..."
docker-compose up -d