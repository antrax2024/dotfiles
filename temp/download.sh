#!/usr/bin/bash
#


yt-dlp --ignore-config --no-playlist --verbose \
  "$1" \
  -o $2
