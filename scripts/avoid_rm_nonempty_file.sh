#!/bin/bash
file=./dummy_data/non_empty_file.txt

if [ -f $file ]; then
    if [ -s $file ]; then
        echo "File '$file' is not empty. Will not remove this file."
    else
        echo "Removing empty file '$file'..."
        rm $file
    fi
else
    echo "File '$file' does not exist."
fi
