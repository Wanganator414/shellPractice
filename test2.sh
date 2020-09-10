#!/bin/sh

# -e flag evaluates escape chars with backslash, -n flag does not print trialing newline. I need to find a way to make it NOT print the flags themselves though
echo -en "Please guess the magic number: "
read X
echo $X | grep "[^0-9]" >/dev/null 2>&1 # /dev/null is a black hole, and 2>&1 redirects stderr to stdout then then to the bh  1=stderr 2=stdout &signifies file descriptor, etc in,out,err, and NOT a filename!
if [ "$?" -eq "0" ]; then
    # If the grep found something other than 0-9
    # then it's not an integer.
    echo "Sorry, wanted a number"
else
    # The grep found only 0-9, so it's an integer.
    # We can safely do a test on it.
    if [ "$X" -eq "7" ]; then
        echo "You entered the magic number!"
    fi
fi

X=0
while [ -n "$X" ]; do   # -n comparator check if length of string is NOT 0
    echo "Enter some text (RETURN to quit)"
    read X
    if [ -z $"X" ]; then    # -z means true when string is 0 length
        echo "You said: ${X}"
    fi
done
