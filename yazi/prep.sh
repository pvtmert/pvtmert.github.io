#!/bin/sh
# Convert markdown to HTML...

DIR="$1"
OUT="$2"
CNT=25
DEX="${1}/index.html"
{
	printf "<html>\n<head>\n<title> Mert\'s entries... </title>\n</head>\n<body style='font-family:mono;text-align:left;right:15%%;'>\n<center>\n<h2> All of my entries... Last is first... </h2>\n</center>\n<hr />\n<ul style='white-space:pre-wrap;'>\n" > "${DEX}"
	echo "<hr />"
	echo "<!-- ENTRIES START -->"
	ls -1vr "${DIR}" | grep -iv "$(basename $0)" | grep -i "\.text$" | head -${CNT} | while read line
	do
		DATE=$(date -u --date="@$(basename ${line} .text)" +"%A, %Y-%m-%d ¦ %H:%M")
		printf "<li> <a href=${line}>${line}</a>: %-35s: $(head -1 ${DIR}/${line}) </li>\n" "${DATE} UTC">> "${DEX}"
		echo "<entry title=\"${DATE}\"><a href=\"/${DIR}/${line}\"><date>${DATE} UTC</date> $(head -1 ${DIR}/${line})</a>"
		markdown "${DIR}/${line}" | tail +2 #tail is for title...
		echo "</entry><hr>"
	done
	printf "</ul>\n</body>\n</html>\n" >> "${DEX}"
	echo "<!-- ENTRIES END -->"
	echo "<a href=\"${DIR}\"> Read More... </a>"
	echo "<hr />"
} > "${OUT}"
