#!/bin/bash

cd /home/aserdev/website/videos || exit

# Create fresh videos.json
echo "[" > ../videos.json
find . -maxdepth 1 -type f -name "*.mp4" | sort | sed 's|^\./||' | awk '{printf "  \"%s\",\n", $0}' | sed '$ s/,$//' >> ../videos.json
echo "]" >> ../videos.json

echo "✅ videos.json updated with $(ls *.mp4 | wc -l) videos!"

