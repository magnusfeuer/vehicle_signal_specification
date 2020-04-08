#!/bin/bash
# Convert all vspec files from list entries to regular objects
#

if [ "$#" != "1" ]
then
    echo "Usage $0 <vspec-root-directory>"
    exit 255
fi

FILES=$(find $1 -name '*.vspec')

for FILE in $FILES
do
    echo "Delisting $FILE"
    sed -i 's/^- //g' $FILE 
    sed -i 's/^#include[[:space:]]*\([^\t ]*\)[[:space:]]*\([^ \t]*\)$/\$include$\:\n  file: \1\n  prefix: \2\n\n/g' $FILE
done
