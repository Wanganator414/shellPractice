#!/bin/sh
lol="Howdy partner" #No spaces before and after '='
echo $lol

# x= 5 without quotes is also okay
x="5"
expr $x + 1 #expr expects nums so in order to work

#Note, if you don't add spaces between the arguments and operators expr will
#just print stuff out

y="YEEET"
expr $y + 2 #expr won't let you get away with this heresy


#Some examples using 'read' builtin command, which reads a line form stdin Watch
#out for uncompleted quotes and unescaped symbols

echo Oh you are approaching me ?
read za_warudo   #Store var
echo $za_warudo Omae Wa Mou Shindeiru!  #Echo var back
