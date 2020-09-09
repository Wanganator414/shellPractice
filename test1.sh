#!/bin/sh
#`[` is a symbolic link to the `test` command, and is a shell builtin symbol that links to test (in most cases) so make sure to SPACE `[` correctly
# test is mainly used in comparisons for conditions
#CAREFUL NOT to name ur .sh file `test`

#if else example
#`;` can be used to put `then in same line as `if`
#Normally then gotta be on different lines
if [ ${1} -eq ${2} ]; then
    echo "${1} is equal to ${2}"
else
    echo "${1} is NOT equal to ${2}"
fi #fi is if backwards

#elif example
if [ ${1} -gt ${2} ]; then
    echo "${1} > ${2}"
elif [ ${1} -lt ${2} ]; then
    echo "${1} < ${2}"
else
    echo "${1} = ${2}"
fi

#NOTE that you cn use [] in conjunction with && and || to do logic checks as well, but readability goes down the drain if over used

[ ${1} -eq ${2} ] && echo "haha"
#Above will print only when the 1st check yields true


[ "$1" -le "0" ] && \
      echo "var1 is less than or equal to  zero"

#`\` here tells the shell that this is not the end of the line, but that the following line should be treated as part of the current line. This is useful for readability. It is customary to indent the following line after a backslash (\) or semicolon (;).