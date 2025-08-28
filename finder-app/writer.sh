#!/bin/bash
# Usage: writer.sh <writefile> <writestr>
# Author: Nimish

#chaeck if there are 2 arguments only
if [[ $# -ne 2 ]]; then
  echo "Error: two arguments required: <file> <str>"
  exit 1
fi

writefile="$1" #file path
writestr="$2" #string to write

#dir path of target file
dirpath="$(dirname "$writefile")"

#To ensure path exists
if ! mkdir -p "$dirpath";
 then
  echo "Error: could not create directory '$dirpath'"
  exit 1
fi


#write string to file
if ! echo "$writestr" > "$writefile";
 then
  echo "Error: could not create file '$writefile'"
  exit 1
fi

