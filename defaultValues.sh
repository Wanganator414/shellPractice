#!/bin/sh

#Using default values example, method 1
#ANYTHING in backticks gte run as shell commands BEFORE the current script and is done in another sub shell btw, any results get spit back to the main sub shell, which itself is running inside a shell XD

echo -n "I am currently in [ `pwd` ]"
read location
if [ -z "${location}" ]; then   #If user input is null, then use cd to current directory
    location=`pwd`
fi
echo "I'm going to list stuff in ${location} now"
ls "${location}"

echo
#Using default values, the lazy way without the if statement

echo -n "I am currently in [ `pwd` ]"
read location  #Empty variables are null/false by default
echo "I'll now list stuff in  ${location:-`pwd`}"     #Apparently `:-` is a shorthand for: if stuff in front is false, use the stuff after the brace expansion
ls "${plant:-`pwd`}"

#Additional syntax: ${value:=DefaultValue} will make $value not be null even if there is no user input throughout the program, hence, DefaultValue will actually be the fallback value for $value 

#Random fact with spawning subprocess for no reason, like eval bash
cd ../  #Bad practice here, once you spawn a sub shell using exec, you end up in another directory like this <
exec bash   #Use `exit` to go back to the previous super shell....