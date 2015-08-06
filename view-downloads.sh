#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for file in $(ls downloads | grep "\.mp3$" | sed s/" "/"%20"/g)
do
	t=$(echo $file | sed s/"%20"/" "/g)
	echo "<p><a href=/downloads/$file>$t</a></p>"
done

IFS=$SAVEIFS