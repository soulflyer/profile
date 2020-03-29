#!/usr/bin/env bash

# add source data42-config.sh to .bashrc
# move your d42one.rc file to d42one.dev.rc and create a symbolic link to it
# (running the hana function will do this for you.)
#
# Usage:
#
# hana
# will tell you what the symbolic link points to
#
# hana <path-to-rc-file>
# sets the rc file link to point to <path-to-rc-file>
#
# hana-dev
# sets the rc file link to point to d42one.dev.rc
#
# hana-test
# sets the rc file link to point to d42one.importer-test-protocol.rc

hana() {
    RCFILE=""
    if [ $D42ONE_CONFDIR ]
    then
        (cd $D42ONE_CONFDIR
         if [ $1 ]
         then
             RCFILE=$1
             if ! [ -L d42one.rc ]
             then
                 cp d42one.rc /tmp
             fi
             rm d42one.rc
             ln -s ./$RCFILE ./d42one.rc
         fi
         ls -l d42one.rc)
    else
        echo "please set D42ONE_CONFDIR to something"
        return
    fi
}

hana-test(){
    hana d42one.test.rc
}

hana-dev(){
    hana d42one.dev.rc
}

oc(){
    if [ -x ./control.sh ]
    then
        ./control.sh $@
    else
        echo "please cd to the directory containing the optimist install you wish to control"
    fi
}

start-all(){
    oc start-all $@
}

stop-all(){
    oc stop-all $@
}

start(){
    oc start $@
}

stop(){
    oc stop $@
}

status(){
    oc status
}

clear-ac-files(){
    if [ $D42ONE_AC_EXCHANGE_PATH ]
    then
        rm -r $D42ONE_AC_STATE_PATH/*
        rm -r $D42ONE_AC_EXCHANGE_PATH/*
    else
        echo "set D42ONE_AC_STATE_PATH and D42ONE_AC_EXCHANGE_PATH and ensure the directories exist"
    fi
}
