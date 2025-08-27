#!/bin/bash
# Usage: writer.sh <writefile> <writestr>


if [ $# -lt 2 ]; then
  echo "Error: two arguments required: <writefile> <writestr>"
  exit 1
fi

writefile="$1"
writestr="$2"


dirpath="$(dirname "$writefile")"
mkdir -p "$dirpath" || { echo "Error: could not create directory '$dirpath'"; exit 1; }


echo "$writestr" > "$writefile" || { echo "Error: could not create file '$writefile'"; exit 1; }
