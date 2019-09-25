#inertia SDK dependencies
sudo apt update
sudo apt install git-core python-argparse python-wstool python-vcstools python-rosdep ros-kinetic-control-msgs ros-kinetic-joystick-drivers ros-kinetic-xacro ros-kinetic-tf2-ros ros-kinetic-rviz ros-kinetic-cv-bridge ros-kinetic-actionlib ros-kinetic-actionlib-msgs ros-kinetic-dynamic-reconfigure ros-kinetic-trajectory-msgs ros-kinetic-rospy-message-converter

#setup workspace
mkdir -p ~/sawyer_ws/src
cd ~/sawyer_ws/src

#download and install inertia SDK
wstool init .
git clone https://github.com/RethinkRobotics/sawyer_robot.git
wstool merge sawyer_robot/sawyer_robot.rosinstall
wstool update

#make
source /opt/ros/kinetic/setup.bash
cd ..
catkin_make

#inertia script
cp ~/sawyer_ws/src/intera_sdk/intera.sh ~/sawyer_ws
vim intera.sh
