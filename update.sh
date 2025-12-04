#!/bin/sh

SOURCE_DIR="$(dirname "$0")"
DEST_DIR="$HOME"

rsync -av --exclude='.git' --exclude='.DS_Store' --exclude='readme.md' --exclude="$(basename "$0")" --exclude='CLAUDE.md' --exclude='claude-info' --exclude='.claude' "$SOURCE_DIR"/. "$DEST_DIR"

echo "Files copied successfully to $DEST_DIR"
