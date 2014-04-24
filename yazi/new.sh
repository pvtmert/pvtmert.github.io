#!/bin/sh

FP=$(dirname $0)
"$VISUAL" "${FP}/$(date +%s).text"

"$FP/../generate.sh" "$FP/.."
