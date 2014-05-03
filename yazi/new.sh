#!/bin/sh

EXT=.md
FP=$(dirname $0)
"$VISUAL" "${FP}/$(date +%s)${EXT}"

"$FP/../generate.sh" "$FP/.."
