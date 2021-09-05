#!/bin/bash

old=$1
new=$2

for f in backup/*db.gz
do
	gunzip -c $f > temp
	sed -i "s@$old@$new@g" temp
	gzip -c temp > $f
done
rm temp

