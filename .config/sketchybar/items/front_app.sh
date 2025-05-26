#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$ACTIVE_ITEM_BG_COLOR \
                                 icon.color=$ACTIVE_ICON_COLOR\
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$ACTIVE_LABEL_COLOR \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
