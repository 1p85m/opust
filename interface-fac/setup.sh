#! /bin/sh

# Required environment : Ubuntu 18.04 LTS
# Comments:
#   - execute this file by root user
#   - install ROS melodic

# prepare setup
cd `dirname "${0}"`
apt update
apt upgrade -y


# install applications
## general
apt install -y ntp
apt install -y emacs
apt install -y openssh-server
apt install -y wget
apt install -y curl
apt install -y openssl
apt install -y python3-pip

## for development
apt install -y make
apt install -y build-essential
apt install -y libssl-dev
apt install -y zlib1g-dev
apt install -y libbz2-dev
apt install -y llvm
apt install -y libreadline-dev
apt install -y libsqlite3-dev
apt install -y libncurses5-dev
apt install -y libncursesw5-dev
apt install -y libpng-dev


# general setup
## ntp configurations
timedatectl set-timezone UTC
cp etc-ntp.conf.osaka /etc/ntp.conf
systemctl restart ntp

## .bashrc configurations
cp $HOME/.bashrc $HOME/.bashrc.`date '%Y%m%d_%H%M%S'`
cat home-user-.bashrc >> $HOME/.bashrc


# python setup
## general
pip3 install --upgrade python-pip
pip3 install ipython
pip3 install numpy
pip3 install scipy
pip3 install matplotlib
pip3 install pandas
pip3 install twisted
pip3 install pyyaml
pip3 install pyparsing
pip3 install psutil

## astro
pip3 install aplpy
pip3 install reproject
pip3 install astroquery
pip3 install wcsaxes
pip3 install healpy

## device driver
pip3 install pyinterface
pip3 install ogameasure
pip3 install necstdb
pip3 install xfftspy

## ros
pip3 install rospkg
pip3 install catkin_pkg
pip3 install empy


# ROS setup
## install ROS
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

apt update
apt install ros-melodic-ros-base
rosdep init

rosdep update
mkdir -p $HOME/ros/src
cd $HOME/ros/src
catkin_init_workspace

## install necst packages
### necst-core
git clone https://github.com/ogawa-ros/necst-core.git $HOME/ros/src/necst-core
git clone https://github.com/ogawa-ros/necst-sisrx.git $HOME/ros/src/necst-sisrx
git clone https://github.com/ogawa-ros/necst-sisrx_dsb.git $HOME/ros/src/necst-sisrx_dsb
git clone https://github.com/ogawa-ros/rospkg-ogameasure.git $HOME/ros/src/rospkg-ogameasure
git clone https://github.com/ogawa-ros/rospkg-pyinterface.git $HOME/ros/src/rospkg-pyinterface
###  necst-topic-monitor
git clone https://github.com/RobotWebTools/rosbridge_suite.git $HOME/ros/src/rosbridge_suite
git clone https://github.com/GT-RAIL/rosauth.git $HOME/ros/src/rosauth
git clone https://github.com/nanten2/necst-monitor.git $HOME/ros/src/necst_monitor

cd $HOME/ros
catkin_make
