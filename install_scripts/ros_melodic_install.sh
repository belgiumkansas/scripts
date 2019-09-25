
#!/usr/bin/env bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y ros-melodic-desktop-full

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
# install the catkin tools
sudo apt install -y python-catkin-tools
sudo apt install -y python-rosdep

sudo rosdep init
rosdep update

# install moveit
sudo apt-get -y install ros-melodic-moveit

sudo apt-get -y install ros-melodic-joy
