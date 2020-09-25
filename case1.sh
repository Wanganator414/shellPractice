#!/bin/sh

echo "Type stuff in"    #The ':' symbol means always true
while :; do
    read input
    case $input in
    "hi") echo "You said hello, well hello to you as well." ;;
    "bye")
        echo "Bye then....."
        break #Break only breaks out of loop, use exit to end script
        ;;
    *) echo "You said something random... keep trying." ;;
    esac
done
echo "DONE"
