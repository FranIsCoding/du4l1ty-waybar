#!/usr/bin/env bash

ICON_PLAY="󰐊"
ICON_PAUSE="󰏤"

sleep 0.2

while true; do
  if playerctl -l >/dev/null 2>&1; then
    if [ "$(playerctl status 2>/dev/null)" = "Playing" ]; then
      echo "$ICON_PAUSE"
    else
      echo "$ICON_PLAY"
    fi

    playerctl --follow status 2>/dev/null | while read -r status; do
      if [ "$status" = "Playing" ]; then
        echo "$ICON_PAUSE"
      else
        echo "$ICON_PLAY"
      fi
    done
  else
    echo "$ICON_PLAY"
    sleep 2
  fi
done
