#!/bin/sh
# INDEX.HTML generator, blog system...

OUTFILE=index.html
HEADER=header.html
FOOTER=footer.html
BODY=body.html
ENTRIES=entry.html
TXTDIR=yazi
SEARCHSTR="IMPORT TXTDIR"

{
	cat "$HEADER"
	LN=$(grep -in "${SEARCHSTR}" "${BODY}" | cut -d: -f1)
	head -n$((LN-1)) "$BODY"
	cat "$ENTRIES"
	tail -n-$((LN-1)) "$BODY"
	cat "$FOOTER"
} > "$OUTFILE"

git add *
git commit -m "Added/Updated a blog post"
git push
