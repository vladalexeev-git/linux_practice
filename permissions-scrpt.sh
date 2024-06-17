#!/bin/bash

OWNER="user1"
GROUP="lab_group"
DIR_PERM="755"
FILE_PERM="644"
TARGET_DIR="$1"

# "$#"- number of arguments passed to the script
# -ne - not equal
# $0 - current file path
if [ "$#" -ne 1 ]; then
  echo "you should input one path"
  echo "usage: $0 <directory>"
  exit 1
fi

# -d check if directory exists
# find - search for files and directories
if [ -d "$TARGET_DIR" ]; then
  echo "directory exists"
  echo "changing owner to $OWNER and group to $GROUP for $TARGET_DIR"
  echo "setting permissions to $DIR_PERM for directories, $FILE_PERM for files"
  sudo chown -Rv "$OWNER":"$GROUP" "$TARGET_DIR"
  sudo find "$TARGET_DIR" -type d -exec chmod $DIR_PERM {} \;
  sudo find "$TARGET_DIR" -type f -exec chmod $FILE_PERM {} \;
  echo "done"
  echo "checking:"
  sudo find "$TARGET_DIR" -exec ls -ld {} \;
else
  echo "directory does not exist"
  exit 1
fi

