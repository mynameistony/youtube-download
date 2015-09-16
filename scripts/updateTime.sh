#!/bin/bash
f="/home/tony/youtube-download/latest.txt"
if [ $# -ne 0 ]
	then

	#if [ $# -eq 2 ]
	#	then
	#	echo "#$2#"	> "$f"
	#	echo "@$(echo "$1" | fold -w 16 | head -n 1)@"  >> "$f"
	#	echo "%$(date "+%I:%M%P")%" >> "$f"

	#else
		echo "@$(echo "$@" | fold -w 16 | head -n 1)@"  > "$f"
		echo "%$(date "+%I:%M%P")%" >> "$f"
		echo "#*11#" >> "$f"
	#fi
else
	echo "%$(date "+%I:%M%P")%" > "$f"
	echo "#000#" >> "$f"

fi
