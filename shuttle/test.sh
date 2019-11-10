#! /bin/sh

# Required environment : Ubuntu 18.04 LTS
# Comments:
#   - execute this file by root user

# prepare setup
cd `dirname "${0}"`
apt update
apt upgrade -y

# install applications
## general
apt install -y ntp
apt install -y emacs
apt install -y openssh-server
apt install -y python3
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
apt install -y catkin

# general setup
## ntp configurations
timedatectl set-timezone UTC
cp /etc/ntp.conf　/etc/ntp.conf.original
cp etc-ntp.conf.osaka /etc/ntp.conf
systemctl restart ntp

## .bashrc configurations
cp $HOME/.bashrc $HOME/.bashrc.`date '%Y%m%d_%H%M%S'`
cat home-user-.bashrc >> $HOME/.bashrc


# python setup
## general
pip3 install ipython
pip3 install numpy
pip3 install scipy
pip3 install matplotlib
pip3 install pandas
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


## install ROS
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

apt update
apt upgrade
apt install -y ros-melodic-ros-base
