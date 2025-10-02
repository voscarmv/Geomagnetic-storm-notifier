#!/bin/bash

HOUR=0;

wget -O ~/Documents/kpf_L59E.txt https://xras.ru/txt/kpf_L59E.txt

cat ~/Documents/kpf_L59E.txt | \
grep '^[^#]' | \
awk -F'|' \
'{print $1; print $4; print $5; print $6; print $7; print $8; print $9; print $10; print $11; print $12}' | \
while read line ; do
	if echo $line | grep -vq '^20' ; then
		TIME=`echo "($HOUR+4)%24" | bc`
		echo $TIME hrs : $line;
		HOUR=`echo $HOUR+3 | bc`
	else
		echo ">>> $line"
		HOUR=0;
	fi
done
read
