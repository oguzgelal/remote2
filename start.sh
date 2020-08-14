#!/bin/bash

apt-get update && apt-get install -y curl

# install docker using the convenience script
sh -c "$(curl -fsSL https://get.docker.com)"

# build & run the container
docker-compose up -d