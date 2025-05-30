#!/bin/bash

case "$SENDER" in
  "mouse.entred")
    sketchybar --set volume_slider drawing=on
    ;;
    "mouse.exited")
    sketchybar --set volume_slider drawing=off
    ;;
esac
