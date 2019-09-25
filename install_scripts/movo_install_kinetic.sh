

# freenect 2 build
git clone https://github.com/OpenKinect/libfreenect2.git ~/libfreenect2
cd ~/libfreenect2/
sudo apt-get -y install build-essential cmake pkg-config
sudo apt-get -y install libusb-1.0-0-dev
sudo apt-get -y install libturbojpeg libjpeg-turbo8-dev
sudo apt-get -y install libglfw3-dev
sudo apt-get -y install beignet-dev
sudo apt-get -y install libopenni2-dev
sudo apt-get -y install ros-kinetic-costmap-2d
sudo mkdir build && cd build
sudo cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2
sudo make
sudo make install

#movo_ws essentials for build
sudo apt -y install ros-kinetic-control-toolbox
sudo apt -y install ros-kinetic-base-local-planner
sudo apt -y install ros-kinetic-move-base-msgs
sudo apt -y install ros-kinetic-controller-interface
sudo apt -y install ros-kinetic-controller-manager
sudo apt -y install ros-kinetic-moveit
sudo apt -y install ros-kinetic-tf2-bullet

#movo_sim essentials
sudo apt -y install ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-yocs-cmd-vel-mux ros-kinetic-move-base ros-kinetic-global-planner ros-kinetic-rviz-imu-plugin ros-kinetic-hector-gazebo-plugins