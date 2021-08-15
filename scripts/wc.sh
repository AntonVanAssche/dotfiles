#!/bin/bash

# Simple script that count words.
# Example: ./wc.sh . sh

nocolor="\e[39m"
red="\e[31m"

if (( $# < 2 )); then
    echo -e "[i] ${red}There must be at least 2 arguments - directory and file extensions to count ${nocolor}"
    exit
fi

DIR=$1
shift
TYPES=( -name "*.$1")
shift
for ext in "$@"; do
    TYPES+=( -or -name \*."$ext" )
done
find "$DIR" -type f \( "${TYPES[@]}" \) -exec wc {} +
