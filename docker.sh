#!/bin/bash

#remove old possible packages
sudo apt-get remove docker docker-engine docker.io

#use docker script
curl -sSL https://get.docker.com/ | sh

sudo usermod -aG docker jeff

#docker machine
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
    sudo install /tmp/docker-machine /usr/local/bin/docker-machine

#docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
