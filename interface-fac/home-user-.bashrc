
# history
# -------
export HISTSIZE=9999
export HISTFILESIZE=999999
export HISTIGNORE=ls:history:pwd
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# ros
# ---
source /opt/ros/melodic/setup.bash
source $HOME/ros/devel/setup.bash
export PYTHONPATH=$PYTHONPATH:$HOME/ros/devel/lib/python2.7/dist-packages
export ROS_PACKAGE_PATH=$HOME/ros/src:$ROS_PACKAGE_PATH
export ROS_IP=192.168.100.195
export ROS_HOSTNAME=192.168.100.195
export ROS_MASTER_URI=http://192.168.100.190:11311
