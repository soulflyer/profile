#!/usr/bin/env sh
# echo $PATH
echo "hello from .profile"

hostspecific=.`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.site// | sed s/\.lan//`_profile
if [ -f ~/"$hostspecific" ]
then
    . ~/"$hostspecific"
fi

export EMAIL="iain@soulflyer.co.uk"
