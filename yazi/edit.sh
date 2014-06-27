#!/bin/bash

x=1
entries[0]="(none)"
for i in *.md; do
	entries[$x]=$i;
	date --date="@$(basename $i .md)" +" $((x++)) > %Y-%m-%d | %H:%M (%S) | %A > $(head -1 $i)"
done

printf "Select number to edit: "
read sel

nano ${entries[$sel]}
