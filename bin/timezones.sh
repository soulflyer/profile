#!/bin/bash

if [[ $TIMEZONES_FILE == "" ]]
then
    export TIMEZONES_FILE="$HOME/.timezones.csv"
fi

if [ ! -s $TIMEZONES_FILE ]
then
    echo 'GMT. Edit ~/.timezones.csv to add other zones,GMT' > $TIMEZONES_FILE
fi

hournow=`date "+%H"`
minsnow=`date "+%M"`
# get rid of the leading 0 so it isn't interpreted as octal
hournow=${hournow#0}
minsnow=${minsnow#0}

while getopts "?h" flag
do
    case $flag in
        "?" | "h" )
            cat <<EOF
# tz will tell the time in multiple timezones.
# It can take a single parameter representing the hour, or none for current time.
# Reads values from $TIMEZONES_FILE (a csv file) for the zones to convert.
# Each line should contain a short descriptive name and a timezone definition.

# eg.
#     UK,GMT
#     Czech,Europe/Prague
#     Iain,Asia/Saigon

# The timezones can be specified using paths found under /usr/share/zoneinfo
EOF
            exit 1
            ;;
    esac
done

if [[ $1 != "" ]]
then
    timehours=$1
    timemins=0
else
    timehours=$hournow
    timemins=$minsnow
fi

offset=$(($timehours - $hournow))
[[ $offset < 0 ]] && offset=$(( offset + 24 ))

while
    IFS=,
    read -r TZNAME TZDEFN
do
    printf "%s %s\n" $(TZ=$TZDEFN date -v "+"$offset"H" -v $timemins"M" "+%H:%M") $TZNAME
done < $TIMEZONES_FILE
