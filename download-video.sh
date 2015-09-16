#!/bin/bash

if [ $# -eq 1 ]
	then
	url=$(echo "$1" | grep "https://[\.a-z]*youtu.*$" -o)
	id=$(youtube-dl --get-id $1)
	title=$(youtube-dl -e "ytsearch:$1")
	safe=$(echo $title | sed s/" "/"%20"/g)	
	cd downloads
	echo "Starting download..." >> "../logs/$id.video.log"
	echo ":$url:"
	youtube-dl --newline -f 18 "$1" | tee "../logs/$id.video.log"
	echo "<a href=/downloads/$safe-$id.mp4>[VIDEO] $title</a>" >> "../logs/$id.video.log"
else
	echo "Need a URL"
fi
