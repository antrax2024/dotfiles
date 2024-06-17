#!/bin/bash
#

yt-dlp --extract-audio --audio-format mp3 --audio-quality 256K "$1"
