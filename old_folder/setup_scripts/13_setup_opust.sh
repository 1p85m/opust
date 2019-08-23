#! /bin/sh

rosdep update

mkdir -p $HOME/ros/src
cd $HOME/ros/src
catkin_init_workspace
cd $HOME/ros

git clone https://github.com/1p85m/opust_ros.git $HOME/ros/src/opust
#git clone https://github.com/1p85m/1p85m_XFFTS.git $HOME/ros/src/1p85mrx_xffts
#git clone https://github.com/1p85m/opust-obsfiles.git $HOME/opust-obsfiles
catkin_make
