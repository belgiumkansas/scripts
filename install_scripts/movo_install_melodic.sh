

# freenect 2 build
git clone https://github.com/OpenKinect/libfreenect2.git ~/libfreenect2
cd ~/libfreenect2/
sudo apt-get install build-essential cmake pkg-config
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install libturbojpeg libjpeg-turbo8-dev
sudo apt-get install libglfw3-dev
sudo apt-get install beignet-dev
sudo apt-get install libopenni2-dev
sudo apt install ros-melodic-costmap-2d 
cd mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2
make
make install

#movo_ws essentials for build
sudo apt install ros-melodic-control-toolbox 
sudo apt install ros-melodic-base-local-planner 
sudo apt install ros-melodic-move-base-msgs 
sudo apt install ros-melodic-controller-interface 
sudo apt install ros-melodic-controller-manager

#movo_sim essentials
sudo apt install ros-melodic-ros-control ros-melodic-ros-controllers ros-melodic-yocs-cmd-vel-mux ros-melodic-move-base ros-melodic-global-planner ros-melodic-rviz-imu-plugin
