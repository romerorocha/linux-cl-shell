#!/bin/bash
# Check if a directory and a file exists and write on file

location=./dummy_data
file_name=for_file_comparison.txt

if [ -d $location ]; then
    echo "OK on the '$location' directory."
    echo "Now checking on the file '$file_name'..."
    if [ -e $location/$file_name ]; then
        echo "OK on the file $file_name."
        echo "Updating file's contents."
        date >>$location/$file_name
    else
        echo "File '$location/$file_name' does not exist."
        echo "Nothing to update."
    fi
else
    echo "Directory '$location' does not exist."
    echo "Nothing to update."
fi
