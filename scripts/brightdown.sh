#!/bin/bash
# Updated 2024-04-16

BRIGHT_PATH=/sys/class/backlight/intel_backlight
NOW_BRIGHT_PATH=$BRIGHT_PATH/brightness
MIN_BRIGHT=1
MAX_BRIGHT=$(cat $BRIGHT_PATH/max_brightness)
PERSIST_PATH=~/.config/settings/backlight
NOW_BRIGHT=$(cat $BRIGHT_PATH/brightness)
INTERVAL=$((($MAX_BRIGHT - $MIN_BRIGHT)/8))
DIFF=$(($NOW_BRIGHT - $MIN_BRIGHT))
if test "$NOW_BRIGHT" = "$MIN_BRIGHT"
then
  : echo "Brightness is equal to min"
else
  if (($DIFF < $INTERVAL));
  then
    echo "$MIN_BRIGHT" > $NOW_BRIGHT_PATH
    echo "$MIN_BRIGHT" > $PERSIST_PATH
  else
    echo "$(($NOW_BRIGHT-$INTERVAL))" > $NOW_BRIGHT_PATH
    echo "$(($NOW_BRIGHT-$INTERVAL))" > $PERSIST_PATH
  fi
  : #echo "Brightness is above min and was decreased"
fi
