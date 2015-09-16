#!/bin/bash

if [ $# -ne 0 ]
	then

	q=$(echo "$@" | sed s/" "/"+"/g)
	cd downloads
	id=$(youtube-dl --newline -f 140 "ytsearch:$q" --get-id)
	title=$(youtube-dl -e "ytsearch:$q")
	safe=$(echo $title | sed s/" "/"%20"/g)
	echo "Starting download..." >> "../logs/$id.video.log"
	youtube-dl --newline -f 18 "ytsearch:$q" | tee "../logs/$id.video.log"
	echo "<a href=/downloads/$safe-$id.mp4>[VIDEO] $title</a>" >> "../logs/$id.video.log"

fi
