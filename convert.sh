#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

cd downloads
while true
do
	for file in $(ls | grep "\.m4a$")
	do
		id=$(echo "$file" | grep "\-[-A-Za-z0-9_]*\.m4a$" -o | sed -e s/"\.m4a"/""/g -e s/"^-"/""/g)
		safe=$(echo "$file" | sed s/" "/"%20"/g | sed s/"m4a$"/"mp3"/g)
		title=$(echo "$file" | sed s/"-[-A-Za-z0-9_]*\.m4a$"/""/g)
		echo "Converting to mp3..." >> "../logs/$id.log"
		soundconverter -b -m mp3 -s .mp3 "$file" 
		echo "<a href=\"/downloads/$safe\">$title</a>" >> "../logs/$id.log"
		cp "$file" "/home/tony/Media/Audio/Music/To Be Sorted/"
		rm "$file"
	done
done
IFS=SAVEIFS