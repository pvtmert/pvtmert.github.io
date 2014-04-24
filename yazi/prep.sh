#!/bin/sh
# Convert markdown to HTML...

DIR="$1"
OUT="$2"
CNT=25

{
	echo "<hr />"
	echo "<!-- ENTRIES START -->"
	ls -1vr "${DIR}" | grep -iv "$(basename $0)" | grep -i "\.text$" | head -${CNT} | while read line
	do
		DATE=$(date -u --date="@$(basename ${line} .text)" +"%A, %Y-%m-%d ¦ %H:%M")
		echo "<entry title=\"${DATE}\"><a href=\"/${DIR}/${line}\"><date>${DATE} UTC</date> $(head -1 ${DIR}/${line})</a>"
		markdown "${DIR}/${line}"
		echo "</entry><hr>"
	done
	echo "<!-- ENTRIES END -->"
	echo "<a href=\"${DIR}\"> Read More... </a>"
	echo "<hr />"
} > "${OUT}"
