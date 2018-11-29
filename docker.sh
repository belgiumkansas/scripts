#!/bin/bash

#remove old possible packages
sudo apt-get remove docker docker-engine docker.io

#add dockers key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


#install stable repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


sudo apt-get update
sudo apt-get install docker-ce

