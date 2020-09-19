#!/bin/sh

#Specially Assigned Variable Names
#----------------------------------
#Positional Parameters $0-9 and $#

#$0 is basename of program it was called from, shell `basename` command can do the same

#$1-9 are the 1st 9 additional params the script was called with

#$@ is all params $1..stuff..stuff..stuffs........ to infinity, preserving spaces

#$* is similar but does NOT preserve WHITESPACE, general rule to use $@ unless you need separation for some reason

#$# tells you the amount of params the script was called with
#----------------------------------

printf "${#} params called with program, program uses 2 params\n"
printf "program name: ${0}\n"
printf "Param1: ${1}  Param2: ${2}\n"
echo "Param List: ${*}"

while [ "$#" -gt "0" ]; do
    echo "\$# is ${#}"
    echo "arg \$1 is ${1}"
    echo "arg \$2 is ${2}"
    echo "---------------"
    shift #Shift literally shifts argument list to the right by one, aka param1 --> param2, $# list minus equal 1 as well.
done

#Return Codes

#$? contains the exit value of the last ran command. Codes range from 0-255, others can be used but treated as mod 256, exit -10 is same as 246 and exit 257 is same as exit 1

Kachowwww
echo "Last command return code: ${?}"
Kachowww
echo "Last command return code: ${?}"
[ "${?}" -ne "0" ] && echo "Problem running last command."
