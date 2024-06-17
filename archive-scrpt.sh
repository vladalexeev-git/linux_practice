#!/bin/bash

# check if we got two arguments
if [ $# -ne 2 ]; then
    echo "usage: $0 <source_directory> <backup_destination>"
    exit 1
fi

# set variables
SOURCE_DIR="$1"
BACKUP_DEST="$2"
CUR_DATE=$(date +%Y%m%d)

# check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# create archive name with current date
BACKUP_FILE="$BACKUP_DEST/backup_${CUR_DATE}.tar.gz"

# create backup
# tar -czfv is c create, z using gzip, f specify archive name, v verbose
echo "creating backup of '$SOURCE_DIR' to '$BACKUP_FILE"
tar -czfv "$BACKUP_FILE" "$SOURCE_DIR"

# check if all good
if [ $? -eq 0 ]; then
    echo "backup has created successfully"
else
    echo "error occurred when creating backup"
fi
