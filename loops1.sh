#!/bin/sh

# `for` loops thru all the args given to it until done
for i in 1 2 3 4 5; do
    echo "Kachowing ${i}"
done #"done" is used ot denote the end of a loop, for,white etc

# echo "\n"

# `*` in this case will be taken and interpreted unless escaped and will list the directory
for i in hello 1 * 2 goodbye; do
    echo "Kachow  i is set to ${i}"
done
