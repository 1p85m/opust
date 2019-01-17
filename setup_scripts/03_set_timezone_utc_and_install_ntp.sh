#! /bin/sh

sudo timedatectl set-timezone UTC

sudo apt-get install ntp -y
sudo cp $HOME/git/opust/config/etc-ntp.conf.osaka /etc/ntp.conf
sudo systemctl restart ntp

ntpq -p
