#!/bin/bash

if [ $# -eq 1 ]
	then
	url=$(echo "$1" | grep "https://[\.a-z]*youtu.*$" -o)
	id=$(youtube-dl --get-id $1)
	cd downloads
	echo "Starting download..." >> "../logs/$id.log"
	echo ":$url:"
	youtube-dl --newline -f 140 "$1" | tee "../logs/$id.log"
 	echo "Waiting to convert..." >> "../logs/$id.log"
else
	echo "Need a URL"
fi
