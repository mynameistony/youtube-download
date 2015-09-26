#!/bin/bash

if [ $# -lt 3 ]
	then

		echo "Usage:"
	else
		input=$(echo "$@" | sed s/"$1 $2 "/""/g)
		cd downloads

		case "$1" in

		"search")
			echo "Searching for: $input"

			q=$(echo "$input" | sed s/" "/"+"/g)
			id=$(youtube-dl "ytsearch:$q" --get-id)
			title=$(youtube-dl -e "ytsearch:$q")
			safe=$(echo $title | sed s/" "/"%20"/g)			
			echo "Starting download..." >> "../logs/$id.log"

			if [ "$2" == "audio" ]
				then
					youtube-dl --newline -f 140 "ytsearch:$q" | tee "../logs/$id.log"
					echo "Waiting to convert..."  >> "../logs/$id.log"
				else
					youtube-dl --newline -f 18 "ytsearch:$q" | tee "../logs/$id.video.log"
					echo "<a href=/downloads/$safe-$id.mp4><img src=/video.png class=icon>$title</a>" >> "../logs/$id.video.log"
			fi
		;;

		"download")
			echo "Downloading from URL: $input"

			id=$(youtube-dl --get-id "$input")
			title=$(youtube-dl -e "$input")
			safe=$(echo $title | sed s/" "/"%20"/g)	

			echo "Starting download..." >> "../logs/$id.log"
			if [ "$2" == "audio" ]
				then
					youtube-dl --newline -f 140 "$input" | tee "../logs/$id.log"
					echo "Waiting to convert..." >> "../logs/$id.log"
				else
					youtube-dl --newline -f 18 "$input" | tee "../logs/$id.video.log"
					echo "<a href=/downloads/$safe-$id.mp4><img src=/video.png class=icon>$title</a>" >> "../logs/$id.video.log"
			fi

		;;

		*)
			echo "Invalid Input"
			exit
		esac 	
fi
