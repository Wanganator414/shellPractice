#!/bin/sh
echo "Hello is $x"
x="LMAO"
x="HAHA"
echo $x

#Whenever a script gets run another shell spawns and does it, so variables
#normally cannot be shared together in an overarching shell session
#However, if the keyword `export` is used in the shell before the script execution, the value of the variable's initial state is saved by the shell session, which will NOT be affected by any change inside scripts however.

# In order to receive environment changes back from the script, we must `source` the script - this effectively runs the script within our own interactive shell, instead of spawning another shell to run it.

# We can source a script via the "." (dot) command by adding '.' in front while executing the script

#In regards to good practice, you can also encase variables in {} to seperate them from text and such so variable names do not get mixed up with printed text and such.

#etc:

echo "Whats ur name?"
read person_name
echo "Hellow ${person_name}!"
echo "Making a file specifically for u: ${person_name}_file.txt in desktop"
touch ~/Desktop/${person_name}_file.txt