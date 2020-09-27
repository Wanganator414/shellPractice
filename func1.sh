#!/bin/sh
#You can choose which program to invoke while executing this script, like sh or bash or something else.

# Side note, apparently the "." turned out to be a shell built-in if used like a command and with a target shell file after it, it is different than doing ./file.sh and exec file.sh apparently? 

# The ".", dot operator used in this case for a shell built in is called 'source', by sourcing a file, the contents of that file will get injected into the current script, so libraries and helper function files can be added thi way

# Note that 'source' and '.' are essentially the same command. Source is a command also.

#Sourcing can also be used to add environmental variables like using export and the like, check current env variables by using 'env' and grepping

# By sourcing files, its end environment is preserved after the script ends, so what ever script runs after will be using what was left over or given to it

# So stuff being sourced is kinda like actually you typing in your current shell by hand and affects it directly instead of a separate process that runs in the bg



















































