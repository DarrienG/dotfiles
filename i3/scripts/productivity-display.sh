#!/usr/bin/env bash
xrandr --output eDP1 --auto --right-of DP1 --rotate normal
xrandr --output DP1 --mode 1920x1200 --left-of eDP1 --rotate left
