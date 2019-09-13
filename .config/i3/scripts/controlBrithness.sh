#!/bin/bash
# Increase or decrease the value of brightness
#
# eDP-1-1 is the actual name of the monitor

BRIGHTNESS=`xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '`
MAX=1.0
MIN=0.0

case "$1" in
    "increase")
        INCREMENT=0.1;;
    "decrease")
        INCREMENT=-0.1;;
    *)
        echo "$1 is not a valid option";;
esac

# Limit brightness value between 0% and 100%
if (( $(echo "$BRIGHTNESS+$INCREMENT <= $MAX" |bc -l) && $(echo "$BRIGHTNESS+$INCREMENT >= $MIN" |bc -l) ))
then
    BRIGHTNESS=`expr "scale=2; $BRIGHTNESS+$INCREMENT" | bc`
fi

xrandr --output eDP-1-1 --brightness "$BRIGHTNESS"
