#!/bin/bash

wget -O ~/Documents/kpfl_SIKA.txt https://xras.ru/txt/kpfl_SIKA.txt

cat ~/Documents/kpfl_SIKA.txt | \
sed '/^#/d;s/ //g;s/\...$//' | \
awk -F'|' '{print $1,$4}' | \
grep -e '[56789]$' | \
while read line ; do
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Solar storm on $line"
done
