#!/bin/sh
#Above line tells the location of the standard bash shell, # + ! is a special directive
#/bin/sh is usually a symbolic link to what ever shell is installed in a Unix
#system

echo Hello there #Echo auto inserts a newline character at the end of a printout

# #Echo will by default insert a space between its arguments received, it does
# not care for spaces between its argument list

echo "Hello    there" #When encase

#The shell parses arguments before passing to echo

echo "Hello      World" # This is a comment, too!
echo "Hello World"
echo "Hello * World"
echo Hello * World
echo Hello World
echo "Hello" World
echo Hello "     " World
echo "Hello "*" World"
echo $(hello) world
echo 'hello' world
