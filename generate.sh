#!/bin/sh
# INDEX.HTML generator, blog system...

if [ -n "$1" ]; then
	OLD_PWD="$PWD"
	cd "$1"
fi

OUTFILE=index.html
HEADER=header.html
FOOTER=footer.html
BODY=body.html
ENTRIES=entry.html
TXTDIR=yazi
SEARCHSTR="IMPORT TXTDIR"
ENTRYSCR="yazi/prep.sh"
COMMENT="Added/Updated a blog post"

${ENTRYSCR} "${TXTDIR}" "${ENTRIES}"
{
	cat "${HEADER}"
	LN=$(grep -in "${SEARCHSTR}" "${BODY}" | cut -d: -f1)
	head -$((LN-1)) "${BODY}"
	cat "${ENTRIES}"
	tail +$((LN-1)) "${BODY}"
	cat "${FOOTER}"
} > "${OUTFILE}"

git add *
git commit -m "${COMMENT}"
git push

if [ "$1" ]; then
	cd "$OLD_PWD"
	unsed OLD_PWD
fi
