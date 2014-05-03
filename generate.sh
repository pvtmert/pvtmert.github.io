#!/bin/sh
# INDEX.HTML generator, blog system...

if [ -n "$1" ]; then
	OLD_PWD="$PWD"
	cd "$1"
elif [ $(dirname $0) != '.' ]; then
	OLD_PWD="$PWD"
	cd $(dirname $0)
fi

EXT=.md
OUTFILE=index.html
HEADER=header.html
FOOTER=footer.html
BODY=body.html
ENTRIES=entry.html
PAGESMD=pbar${EXT}
TXTDIR=yazi
SEARCHSTR=" IMPORT "
ENTRYSCR="${TXTDIR}/prep.sh"
PAGESCMD="$(which markdown) ${PAGESMD}"

if [ -z "${COMMENT}" ]; then
	COMMENT="Added/Updated a blog post"
fi

"${ENTRYSCR}" "${TXTDIR}" "${ENTRIES}"
{
	cat "${HEADER}"
	LN=$(grep -in "${SEARCHSTR}" "${BODY}" | cut -d: -f1)
	head -$((LN-1)) "${BODY}"
	cat "${ENTRIES}"
	tail +$((LN+1)) "${BODY}"
	#cat "${FOOTER}" #disabled due adding these stuff:
	LN=$(grep -in "${SEARCHSTR}" "${FOOTER}" | cut -d: -f1)
	head -$((LN-1)) "${FOOTER}"
	${PAGESCMD}
	tail +$((LN+1)) "${FOOTER}"
} > "${OUTFILE}"

exit 0

git add *
git commit -m "${COMMENT}"
git push

if [ "$OLD_PWD" ]; then
	cd "$OLD_PWD"
	unset OLD_PWD
fi

exit 0
