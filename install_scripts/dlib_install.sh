#!/usr/bin/env bash

#OS libraries
sudo apt -qq -y install build-essential cmake pkg-config
sudo apt -qq -y install libx11-dev libatlas-base-dep
sudo apt -qq -y install libgtk-3-dev libboost-python-dev

#python libs
sudo pip install numpy

#pull git repo
cd ~/
git clone https://github.com/davisking/dlib.git
