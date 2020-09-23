#!/bin/sh
# Some examples using `read` and `while` to go through files
# Each line must end with a LF (newline) - if cat `file` doesn't end with a blank line, that final line will not be processed
while read f; do
    case ${f} in
    1) echo ONE ;;
    2) echo TWO ;;
    3) echo THREE ;;
    4) echo FOUR ;;
    5) echo FIVE ;;
    6) echo SIX ;;
    7) echo SEVEN ;;
    *) echo LASTLINE is ${f} ;;
    esac #NOTE esac is case backwards! :D
done <~/Desktop/testReadlines  #One way to direct files to script

#Uber lazy way to do a quick loop
touch file{0,1,2,3}.txt

#ls -ld {,usr,usr/local}/{bin,sbin,lib} quick way to do combinations of arguments
# It will list combo of {1} and {2} which 9 combinations of file paths

#Alternate way to do above, works on some Unix systems, but relies on external program `line`, which is why it is enclosed with backticks
while f=$(line); do
    echo ${f}
done <~/Desktop/testReadlines
