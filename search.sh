#!/bin/bash

if [ $# -ne 0 ]
	then

	q=$(echo "$@" | sed s/" "/"+"/g)
	cd downloads	
	id=$(youtube-dl --newline -f 140 "ytsearch:$q" --get-id)
	echo "Starting download..." >> "../logs/$id.log"
	youtube-dl --newline -f 140 "ytsearch:$q" | tee "../logs/$id.log"

fi
