#! /bin/sh

# .bashrc
cp $HOME/.bashrc $HOME/.bashrc.original
cp $HOME/git/opust/config/.bashrc_melodic $HOME/.bashrc

# vnc
vncserver :20
vncserver -kill :20
cp $HOME/git/opust/config/.vnc-xstartup $HOME/.vnc/xstartup
