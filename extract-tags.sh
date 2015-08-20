#!/bin/bash
artist=$(echo $@ | grep "^[[:print:]]* - " -o | sed s/" - $"/""/g)
track=$(echo $@ | grep " - [[:print:]]*\.mp3" -o | sed -e s/"^ - "/""/g -e s/"-[-A-Za-z0-9_]*\.mp3$"/""/g)

id3v2 -a "$artist" "$@"
id3v2 -t "$track" "$@"
id3v2 -R "$@"