#! /bin/sh

pip install --upgrade python-pip
pip install twisted
pip install pymongo

cd $HOME/ros/src
git clone https://github.com/RobotWebTools/rosbridge_suite.git
git clone https://github.com/GT-RAIL/rosauth.git
#git clone https://github.com/1p85m/opust-monitor.git opust_monitor

cd $HOME/ros
catkin_make
