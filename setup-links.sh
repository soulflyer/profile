#!/bin/bash
# This is not really tested, more of a record of links needed.
# Probably easier to set it up using dired-do-symlink

INSTALL_DIR=~/Code/profile
HOST=`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.site//`

ln -s $INSTALL_DIR/profile         ~/.profile
ln -s $INSTALL_DIR/bashrc          ~/.bashrc
ln -s $INSTALL_DIR/bash_profile    ~/.bash_profile

ln -s $INSTALL_DIR/${HOST}_rc      ~/.${HOST}_rc
ln -s $INSTALL_DIR/${HOST}_profile ~/.${HOST}_profile

ln -s $INSTALL_DIR/gitignore       ~/.gitignore

ln -s $INSTALL_DIR/work.sh         ~/bin/work
ln -s $INSTALL_DIR/changefont.sh   ~/bin/changefont
ln -s $INSTALL_DIR/yabai/.yabairc  ~/.yabairc
ln -s $INSTALL_DIR/yabai/.skhdrc   ~/.skhdrc
ln -s $INSTALL_DIR/yabai/yabai-decrease-x.sh ~/bin/yabai-decrease-x.sh
ln -s $INSTALL_DIR/yabai/yabai-increase-x.sh ~/bin/yabai-increase-x.sh
ln -s $INSTALL_DIR/yabai/yabai-decrease-y.sh ~/bin/yabai-decrease-y.sh
ln -s $INSTALL_DIR/yabai/yabai-increase-y.sh ~/bin/yabai-increase-y.sh
ln -s $INSTALL_DIR/bin/tracker.sh ~/bin/tracker
ln -s $INSTALL_DIR/bin/calendar.sh ~/bin/calendar
ln -s $INSTALL_DIR/bin/print-bundle-executable-path.sh ~/bin/pbx
ln -s $INSTALL_DIR/bin/open-browser-window.sh ~/bin/open-browser-window
