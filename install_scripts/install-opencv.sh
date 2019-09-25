#!/bin/bash

# CONFIGURATION

# OpenCV Version
ocv_ver='3.3.0'

# GUI framework: qt, gtk
gui_fw='qt'


# KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove


# INSTALL THE DEPENDENCIES

# Dependency modifications based on GUI choice
case $gui_fw in
qt)
  gui_lib='qt5-default'
  cmake_opts='-DWITH_QT=ON'
  ;;
gtk)
  gui_lib='libgtkglext1-dev'
  ;;
esac

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI
sudo apt-get install -y ${gui_lib} libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen


# INSTALL THE LIBRARY

sudo apt-get install -y unzip wget
wget https://github.com/opencv/opencv/archive/${ocv_ver}.zip
unzip ${ocv_ver}.zip
rm ${ocv_ver}.zip
mv opencv-${ocv_ver} OpenCV
cd OpenCV
mkdir build
cd build
cmake ${cmake_opts} -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
make -j4
sudo make install
sudo ldconfig


# EXECUTE SOME OPENCV EXAMPLES AND COMPILE A DEMONSTRATION

# To complete this step, please visit 'http://milq.github.io/install-opencv-ubuntu-debian'.
