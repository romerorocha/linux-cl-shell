#!/bin/bash

file=./dummy_data/read_only.txt

if [ -f $file ]; then
    echo "File was found."
    if [ -w $file ]; then
        echo "Writing on file..."
        date >>$file
    else
        echo "File is read only."
    fi
else
    echo "File does not exist."
fi
