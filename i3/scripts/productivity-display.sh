#!/usr/bin/env bash
xrandr --output eDP-1 --auto --right-of DP-1 --rotate normal
xrandr --output DP-1 --mode 1920x1200 --left-of eDP-1 --rotate left
