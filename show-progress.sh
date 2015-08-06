#!/bin/bash

if [ $# -eq 0 ]
	then
	for log in $(ls -t logs | head -n 10)
	do
		
		status=$(tail -n 1 logs/$log)
		d=$(echo "$status" | grep "<a href" | wc -l)

		if [ $d -eq 0 ]
			then
			p=$(echo "$status" | grep "[0-9. ]*%" -o | wc -l)

			if [ $p -eq 0 ]
				then
				echo "<p style=\"width:100%;background-color:yellow;border-radius:50px;font-size:50px;\">$status"
			else
				v=$(echo -n "$status" | grep "[0-9. ]*%" -o | sed s/"\.[0-9]"/""/g)
				echo "<p style=\"width:$v;background-color:yellow;border-radius:50px;font-size:50px;\">$v</p>"
			fi
		else
			echo "<p class=bubble>$status"
		fi
		echo "</p>"
	done
fi
