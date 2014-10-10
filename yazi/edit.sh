#!/bin/bash

test -z "$VISUAL" && VISUAL=$(which nano)

DATE_EX=$(which date)
FMTSTR=$(uname -a | grep -qi "darwin" && echo "-r " || echo "--date=@")

x=1
entries[0]="(none)"
for i in *.md; do
	entries[$x]=$i;
	${DATE_EX} -u ${FMTSTR}"$(basename $i .md)" +" $((x++)) > %Y-%m-%d | %H:%M (%S) | %A > $(head -1 $i)"
done

printf "Select number to edit: "
read sel

${VISUAL} ${entries[$sel]}
