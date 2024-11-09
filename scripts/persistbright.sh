#!/bin/bash
BRIGHT_PATH=/sys/class/backlight/intel_backlight
NOW_BRIGHT_PATH=$BRIGHT_PATH/brightness
PERSIST_PATH=~/.config/settings/backlight
PERSIST_VAL=$(cat $PERSIST_PATH)

if test $PERSIST_VAL = ""
then
  :
else
  echo $PERSIST_VAL > $NOW_BRIGHT_PATH
fi
