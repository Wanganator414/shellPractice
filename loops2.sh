#!/bin/sh
# `while` can do more logic,
#Example with standard while loop condition
INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]; do #Spacing between [ and ] are important!
    echo "Plz type something here (bye to quit)"
    read INPUT_STRING
    echo "You typed: ${INPUT_STRING}"
done


while :; do #`:` results in always true, a bit crude and is recommended to use more sophisticated conditions, but has its use due to its simplicity
    echo "Please type something in (^C to quit)"
    read INPUT_STRING
    echo "You typed: ${INPUT_STRING}"
done

