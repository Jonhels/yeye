#!/bin/bash

#Here we have functions that i have created for the code
CURRENT_LINE_NUM=0
#This is a function called current line number, it will 
#be 0 so the loop knows where we are in the input file

IS_VOWEL=false
#Function for vowel this will always return false if there are no
#vowels to be fond

#Here we have the loop, this is a while loop that runs while we read
#the file line by line. 
while read -r line
do
# Increment current line number
#This means that we are starting on the top with the function current line
#This function gets added +1 on every loop so we can read all the lines in the file
CURRENT_LINE_NUM=$((CURRENT_LINE_NUM+1))

# If line number is 1, check if word starts with a vowel
#This checks if we are on line number one, this is a nested if statement 
#When The current line number is eaqual to 1 we will go to 'then' 
if [[ "$CURRENT_LINE_NUM" -eq 1 ]];
then
# Check the first letter of the current word to see if it's a vowel
#Here we go on line 0-1 and check if the first word contains any 
#This is a new if statement that are within another, this means that we have a 
 #nested if statement.
if [[ "${line:0:1}" == *[AEIOUaeiou]* ]]; 
then
#When we have passed the first part in the if statement we go to the next line with 'then'
#Here we tell the is vowel function to turn from false to true since we got match on a vowel.
IS_VOWEL=true
fi
fi

#Line is just the word we have set for the loop from the input file. We are still in the 
#loop and here we will be doing some work to check the word length and add a number that 
#says how many characters we have in each word.
WORD_LENGTH=$(echo $line | wc -c)
#After we have done the word count we will have to add this to a temporary file
#This file is deleted at the end of the script.
echo "$WORD_LENGTH $line" >> words-sorted.tmp.txt
#When we are at the done command we will have to add $1 so we have an input.
#The input $1 means that we are giving the loop an argument. This argument is in our case the files.
done < $1

#This if statement sees if we have a vowel by checkign the true or fase on vowel function.
if [ "$IS_VOWEL" = true ];
#After this we go to the sorting
then
#The unsorted list is first sorted with the sort command which is then piped into head
#We do only want to have the top 10 on a vowel 
sort -r words-sorted.tmp.txt | head -n 10 > words-sorted.txt
else
#and top 15 on no vowel. 
sort -r words-sorted.tmp.txt | head -n 15 > words-sorted.txt
fi
#here the if statement is finished and we then have to remove the words sorted temporary file. 
#we do this by using rm command.
rm words-sorted.tmp.txt