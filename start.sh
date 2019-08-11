#!/usr/bin/env bash
new_file=${PWD##*/}

mv $(pwd)/ArduinoTemplate.ino $(pwd)/$new_file.ino
sed -i "s/ArduinoTemplate/$new_file/g" $new_file.ino
