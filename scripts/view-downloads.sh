#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
totalcount=$(ls downloads | wc -l)
audiocount=$(ls downloads | grep "\.mp3$" | wc -l)
videocount=$(ls downloads | grep "\.mp4$" | wc -l)

echo "<center>"
echo "<b>$totalcount</b> total downloads<br>"
echo "$audiocount songs, $videocount videos"
echo "<p>Audio</p>"
for file in $(ls downloads | grep "\.mp3$" | sed s/" "/"%20"/g)
do
	t=$(echo $file | sed s/"%20"/" "/g)
	echo "<p class=bubble><a href=/downloads/$file>$t</a></p>"
done

echo "</center>"

IFS=$SAVEIFS