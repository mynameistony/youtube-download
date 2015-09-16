#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
count=$(ls downloads | wc -l)

echo "<center>"
echo "<b>$count</b> downloads"

for file in $(ls downloads | grep "\.mp3$" | sed s/" "/"%20"/g)
do
	t=$(echo $file | sed s/"%20"/" "/g)
	echo "<p class=bubble><a href=/downloads/$file>$t</a></p>"
done

echo "</center>"

IFS=$SAVEIFS