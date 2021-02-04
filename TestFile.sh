#!/bin/bash
# Author: Caroline Chang
# Date: 2/3/2021
# Script serves as an editing tool for a document using
# predefined functions.

fileName=$1

#Counts the number of lines within the file.
count_lines(){
	lines=$(grep "." -c $fileName)
	echo "There are $lines lines in $fileName."
}

#Shows all lines containing Lorem or Model or Ispum or Will.
count_words(){
	value=`egrep -n 'Lorem|model|Ispum|will' $fileName`
	echo $value
}

#Adds text to file with an added text towards the end that says "I learnt about Lorem Ipsum typsetter!!"
add_text(){
	echo "What would you like to add to the text?"
	read header
	footer=" I learnt about Lorem Ipsum typsetter!!"
	body="$header$footer"
	echo $body >> $fileName
}

#Makes a new directory for solutions if it does not exist and then puts a copy of the file read and moves it over there.
#DOES NOT EXIT SHELL SCRIPT, EXIT OCCURS IN THE NATURAL PROGRESSION OF THE LOOP!
copy_and_exit(){
	if [ ! -d "solution" ]
	then
		mkdir "solution"
	fi
	direct="solution/"
	path="$direct$fileName"
	cp $fileName $path
}

#Main body of program begins.
echo "Hiya!"
echo "Starting search for $fileName....."
if test -f "$fileName";then
	echo "File has been found."
	shouldLoop=1
	while [ $shouldLoop -gt 0 ]
	do
		echo "What would you like to do?"
		echo "1) Count Lines."
		echo "2) Count Words."
		echo "3) Add Text."
		echo "4) Copy and Exit."
		read userSelection
		case $userSelection in
			[1])
				echo "You have choosen to Count Lines."
				count_lines
				;;
			[2])
				echo "You have choosen to Count Words."
				count_words
				;;
			[3])
				echo "You have choosen to Add Text."
				add_text
				;;
			[4])
				echo "You have choosen to Copy and Exit."
				copy_and_exit
				shouldLoop=0;;
			*)
				echo "Input not recongnized, please try again.";;
		esac
	done
else
	echo "I am sorry, but the file by the name of $fileName does not exist."
fi
echo "Goodbye!"
