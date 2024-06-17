#!/bin/bash

TARGET_FILE="$1"
OUTPUT_FILE="sorted.txt"

if [ "$#" -ne 1 ]; then
  echo "you should input one file path"
  echo "usage: $0 <file>"
  exit 1
fi

# $? is the exit status of the last command
if [ -f "$TARGET_FILE" ]; then
  echo "file exists"
  echo "sorting.."
  sort "$TARGET_FILE" > "$OUTPUT_FILE"
  if [ $? -ne 0 ]; then
    echo "sorting failed"
    exit 1
  fi
  echo "done, output file: $OUTPUT_FILE"
else
  echo "file does not exist"
  exit 1
fi