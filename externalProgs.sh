#!/bin/sh

#Two examples of using backticks for pre script code execution, where the 2nd case can save you execution time by only running costly operations once

#Case 1: Gets all html files on your PC and look for index and contents pages, note that this operation runs twice, which is quite costly

# find / -name "*.html" -print | grep "/index.html$"
# find / -name "*.html" -print | grep "/contents.html$"

#Case 2: Puts all that heavy stuff into a variable, so you only need to run it once

HTML_FILES=$(find / -name "*.html" -print) #Output of the command in backticks (stdout) will be caught and put into the variable HTML_FILES
echo "$HTML_FILES" | grep "/index.html$"   #Note: You need quotes around grep if you want to preserve the line by line nature of the output form all the mthl files, or else you will get one LONG line fo text
echo "$HTML_FILES" | grep "/contents.html$"

# Here's some alternate syntax $(..):
HTML_FILES=$(find / -name "*.html" -print)
# Stated advantage of this is that it can be nested, which the backticks cannot, but most cases you just put it in a variable and be done with the unreadable mess

# Some other quick examples of using backticking

userName=`grep "^${USER}:" /etc/passwd | cut -d":" -f5` #This line fetches user name from ur passwd file, well, you can literally do it with just $USER env variable but this is for practice...
echo ${userName}
# grep grabs whatever lines have the value of $USER in the start of the line, this is different from [^${USER}], the ^ in this one has "" quotes and means start of while the bracket one means exclude ${USER}.
# The cut command uses colon as the delimiter for the file and gets the 5th field, or the name part
