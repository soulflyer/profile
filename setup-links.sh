#!/bin/bash

INSTALL_DIR=~/Code/profile
HOST=`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.site//`

ln -s $INSTALL_DIR/profile         ~/.profile
ln -s $INSTALL_DIR/bashrc          ~/.bashrc
ln -s $INSTALL_DIR/bash_profile    ~/.bash_profile

ln -s $INSTALL_DIR/${HOST}_rc      ~/.${HOST}_rc
ln -s $INSTALL_DIR/${HOST}_profile ~/.${HOST}_profile

ln -s $INSTALL_DIR/gitignore       ~/.gitignore

ln -s $INSTALL_DIR/work.sh         ~/bin/work

ln -s $INSTALL_DIR/yabai/.yabairc  ~/.yabairc
ln -s $INSTALL_DIR/yabai/.skhdrc   ~/.skhdrc
ln -s $INSTALL_DIR/yabai/yabai-decrease-x.sh ~/bin/yabai-decrease-x.sh
ln -s $INSTALL_DIR/yabai/yabai-increase-x.sh ~/bin/yabai-increase-x.sh
