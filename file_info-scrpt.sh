#!/bin/bash
# check if there are only one argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi


TARGET_FILE=$1

# check if the file exists
if [ ! -e "$TARGET_FILE" ]; then
    echo "File '$TARGET_FILE' does not exist."
    exit 1
fi

# determine whether the file is a directory or a regular file
if [ -d "$TARGET_FILE" ]; then
    FILE_TYPE="Directory"
elif [ -f "$TARGET_FILE" ]; then
    FILE_TYPE="Regular file"
else
    FILE_TYPE="Undefined type"
fi

# file permissions
# stat -c "%A" is -c - format, %A - permission bits and file type in human readable form
PERMISSIONS=$(stat -c "%A" "$TARGET_FILE")

# file size
# du -sh is - disk usage summary human readable
# awk '{print $1}' - get the first field of ls -l before space
FILE_SIZE=$(du -sh "$TARGET_FILE" | awk '{print $1}')

# print the results
echo "Info: '$TARGET_FILE':"
echo "Type: $FILE_TYPE"
echo "Permissions: $PERMISSIONS"
echo "Size: $FILE_SIZE"
