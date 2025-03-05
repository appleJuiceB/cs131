#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: batchrename <old_text> <new_text> <file_pattern>"
    exit 1
fi

old_text="$1"
new_text="$2"
file_pattern="$3"

# Check if any files match the pattern
files=$(ls $file_pattern 2>/dev/null)
if [ -z "$files" ]; then
    echo "No files matching pattern: $file_pattern"
    exit 1
fi

# Rename files
for file in $files; do
    if [[ "$file" == *"$old_text"* ]]; then
        new_name="${file//$old_text/$new_text}"
        mv "$file" "$new_name"
        echo "Renamed: $file -> $new_name"
    fi
done

