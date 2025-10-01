#!/bin/bash

wget -O ~/Documents/kpfl_L59E.txt https://xras.ru/txt/kpfl_L59E.txt

cat ~/Documents/kpfl_L59E.txt | \
sed '/^#/d;s/ //g;s/\...$//' | \
awk -F'|' '{print $1,$4}' | \
grep -e '[56789]$' | \
while read line ; do
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Solar storm on $line"
done
