#!/usr/bin/bash
#

DEST_DIR='~/rustdesk'

mkdir -p $DEST_DIR

curl https://github.com/rustdesk/rustdesk/releases/download/1.2.3/rustdesk-1.2.3-x86_64.AppImage -o $DEST_DIR/rustdesk.AppImage

chmod +x $DEST_DIR/rustdesk.AppImage
