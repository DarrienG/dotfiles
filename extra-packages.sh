#!/usr/bin/env bash

echo "Installing alternative packages..."
echo "\tbrightness utils"
git clone https://github.com/haikarainen/light /tmp/light
cd /tmp/light
./autogen.sh && ./configure && make && sudo make install
cd
