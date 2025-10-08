#!/bin/bash

HOUR=0;

wget -O ~/Documents/kpf_SIKA.txt https://xras.ru/txt/kpf_SIKA.txt

cat ~/Documents/kpf_SIKA.txt | \
grep '^[^#]' | \
awk -F'|' \
'{print $1; print $4; print $5; print $6; print $7; print $8; print $9; print $10; print $11; print $12}' | \
while read line ; do
	if echo $line | grep -vq '^20' ; then
		if test $HOUR = 0 ; then
			TIME=0
		else
			TIME=`echo "3*($HOUR-1)+1" | bc`
		fi
		echo $TIME hrs : $line;
		HOUR=`echo $HOUR+1 | bc`
	else
		echo ">>> $line"
		HOUR=0;
	fi
done
read
