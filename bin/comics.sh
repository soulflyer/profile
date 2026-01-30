#!/bin/bash

for link in \
    http://xkcd.com/ \
    https://sinfest.dreamhosters.com/ \
    http://www.gocomics.com/luann \
    http://www.gocomics.com/calvinandhobbes \
    http://www.jesusandmo.net/ \
    http://www.smbc-comics.com/ \
    http://www.leasticoulddo.com/
do
    setsid open $link
done
