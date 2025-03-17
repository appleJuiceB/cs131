# batchRename - Bulk Renaming Tool

## What this command does

- Allows users to rename multiple files by replacing a specified substring in their filenames with a new string.

## Why/When this command is useful

- Can be useful for photographers, developers, or anyone managing multiple files.  
- Saves time and effort by avoiding manual renaming.

## How to use the command

- Usage:  
  batchRename.sh <old_text> <new_text> <file_pattern>  

  - old_text: The text you want to replace in the file name.  
  - new_text: The new text to replace the old text.  
  - file_pattern: The pattern to match files (for example: *.jpg or *.txt).  

## Example

Before running the command:  

IMG_001.jpg  
IMG_002.jpg  
IMG_003.jpg  

Command execution:  
./batchRename.sh "IMG_"  "MRIscan_"  "*.jpg"  

After running the command:  

MRIscan_001.jpg  
MRIscan_002.jpg  
MRIscan_003.jpg  

