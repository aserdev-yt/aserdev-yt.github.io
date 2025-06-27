#!/bin/bash

VIDEO_DIR="/home/aserdev/website/videos"
THUMB_DIR="/home/aserdev/website/thumbs"

mkdir -p "$THUMB_DIR"

for file in "$VIDEO_DIR"/*.mp4; do
    filename=$(basename "$file" .mp4)
    output="$THUMB_DIR/$filename.jpg"

    # skip if already exists
    [ -f "$output" ] && continue

    # Grab a frame from 10 seconds in (or adjust this)
    ffmpeg -ss 00:00:10 -i "$file" -frames:v 1 -q:v 2 "$output"
done

echo "✅ Thumbnails generated in $THUMB_DIR"

