#!/bin/bash
BRIGHT_PATH=/sys/class/backlight/intel_backlight
NOW_BRIGHT_PATH=$BRIGHT_PATH/brightness
MIN_BRIGHT=1
MAX_BRIGHT=$(cat $BRIGHT_PATH/max_brightness)
NOW_BRIGHT=$(cat $BRIGHT_PATH/brightness)
PERSIST_PATH=~/.config/settings/backlight
INTERVAL=$((($MAX_BRIGHT-$MIN_BRIGHT)/8))
DIFF=$(($MAX_BRIGHT-$NOW_BRIGHT))
# echo $INTERVAL
if test "$NOW_BRIGHT" = "$MAX_BRIGHT"
then
  : #echo "Brightness is equal to max"
else
  if (($DIFF < $INTERVAL));
  then
    echo "$MAX_BRIGHT" > $NOW_BRIGHT_PATH
    echo "$MAX_BRIGHT" > $PERSIST_PATH
  else
    echo "$(($INTERVAL+$NOW_BRIGHT))" > $NOW_BRIGHT_PATH
    echo "$(($INTERVAL+$NOW_BRIGHT))" > $PERSIST_PATH
  fi
  : #echo "Brightness is below max and was increased"
fi
