

# freenect 2 build
git clone https://github.com/OpenKinect/libfreenect2.git ~/libfreenect2
cd ~/libfreenect2/
sudo apt-get install build-essential cmake pkg-config
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install libturbojpeg libjpeg-turbo8-dev
sudo apt-get install libglfw3-dev
sudo apt-get install beignet-dev
sudo apt-get install libopenni2-dev
sudo apt install ros-kinetic-costmap-2d 
cd mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2
make
make install

#movo_ws essentials for build
sudo apt install ros-kinetic-control-toolbox 
sudo apt install ros-kinetic-base-local-planner 
sudo apt install ros-kinetic-move-base-msgs 
sudo apt install ros-kinetic-controller-interface 
sudo apt install ros-kinetic-controller-manager

#movo_sim essentials
sudo apt install ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-yocs-cmd-vel-mux ros-kinetic-move-base ros-kinetic-global-planner ros-kinetic-rviz-imu-plugin