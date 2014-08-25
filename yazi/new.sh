#!/bin/sh

test -z "$VISUAL" && export VISUAL=nano # os x fix workaround
EXT=.md
FP=$(dirname $0)
"$VISUAL" "${FP}/$(date +%s)${EXT}"

"$FP/../generate.sh" "$FP/.."
