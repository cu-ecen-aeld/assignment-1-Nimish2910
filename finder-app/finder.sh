#!/bin/bash
# Usage: finder.sh <filesdir> <searchstr>
# author: Nimish

#Check if argument is not equal to 2
if [ $# -ne 2 ];
 then
  echo "Error: two arguments required: <filesdir> <searchstr>"
  exit 1
fi

filesdir="$1" #assign first argument as dir to search
searchstr="$2" #assign seconf argument as search string

#check if path is valid
if [ ! -d "$filesdir" ];
 then
  echo "Error: '$filesdir' is not a directory"
  exit 1
fi

#count total number of files
num_files=$(find "$filesdir" -type f | wc -l)

#count matching lines and save
num_matches=$(grep -R -F -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

#print total no of files and number of matches
echo "The number of files are $num_files and the number of matching lines are $num_matches"
