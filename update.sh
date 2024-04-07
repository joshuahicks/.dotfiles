#!/bin/zsh

SOURCE_DIR="$HOME/personal/github/.dotfiles"
DEST_DIR="$HOME"

rsync -av --exclude='.git' --exclude='.DS_Store' --exclude='readme.md' --exclude="$(basename "$0")" "$SOURCE_DIR"/. "$DEST_DIR"

echo "Files copied successfully to $DEST_DIR"
