#!/bin/bash

INSTALL_DIR=~/Code/profile
HOST=`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.site//`

ln -s $INSTALL_DIR/profile      ~/.profile
ln -s $INSTALL_DIR/bashrc       ~/.bashrc
ln -s $INSTALL_DIR/bash_profile ~/.bash_profile

ln -s $INSTALL_DIR/${HOST}_rc   ~/.${HOST}_rc
ln -s $INSTALL_DIR/${HOST}_profile  ~/.${HOST}_profile
