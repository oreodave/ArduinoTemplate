#!/usr/bin/env bash
new_file=${PWD##*/}

mv $(pwd)/ArduinoTemplate.ino $(pwd)/$new_file.ino
mkdir dist;
"" > README.org
rm start.sh
