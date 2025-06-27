#!/bin/bash

VID_DIR="./videos"
OUT="videos.json"

echo "[" > $OUT

first=true
for f in "$VID_DIR"/*.mp4; do
    fname=$(basename "$f")
    if [ "$first" = true ]; then
        first=false
    else
        echo "," >> $OUT
    fi
    echo "  \"$fname\"" >> $OUT
done

echo "]" >> $OUT

echo "✅ videos.json created with $(cat $OUT | grep .mp4 | wc -l) videos!"

