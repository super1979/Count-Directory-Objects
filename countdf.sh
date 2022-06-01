#!/bin/bash

f=0 # setting the number of non-empty files to be 0
ef=0 # setting the number of empty files to be 0
d=0 # setting the number of non-empty directories to be 0
ed=0 # setting the number of non-empty directories to be 0

for item in "$1"/*; do # a for loop to iterate over all items in the directory path stored in $1 variable

    if [[ -d $item ]]; then # tests whether item is a directory

        count=$(ls $item | wc -l) # lists the contents of item and counts the number of content in item
        
        if [[ $count -eq 0 ]]; then # tests whether directory is empty
            ((ed++)) # increases the count of empty directories by 1
        else # non-empty directory go to this block of code
            ((d++)) # increases the count of non-empty directories by 1
        fi

    else # files go to this block of code
    
        if [[ -s $item ]]; then # tests whether file is non-empty
            ((f++)) # increases the count of non-empty files by 1
        else # empty files go to this block of code
            ((ef++)) # increases the count of empty files by 1
        fi

    fi

done

echo -e "The $1 directory contains:\n$f files that contain data\n$ef files that are empty\n$d non-empty directories\n$ed empty directories" # prints results to terminal

exit 0
