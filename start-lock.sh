#!/usr/bin/env bash

if [[ ! -x "$(command -v i3lock-fancy)"  ]]; then
  i3lock-fancy
elif [[ ! -x "$(command -v i3lock)" ]]; then
  i3lock
else
  echo "No lockscreen wtf man" > "$HOME/install-a-goddamn-lockscreen-mate"
fi
