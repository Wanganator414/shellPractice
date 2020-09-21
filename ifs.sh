#!/bin/sh
#IFS Internal Field Separators

#$IFS is mutable, default value is SPACE TAB NEWLINE, if you do need to change it be sure ot change it back

defaultIFS="${IFS}"
IFS=+
echo "Type stuff separated by + signs:"
read x y z      #Each parameter is separated and read based on + signs now
IFS="${defaultIFS}" #Add quotes around just in case you get random characters in the behind the actual variable
echo "x is $x y is $y z is $z"