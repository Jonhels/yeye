#!/bin/bash
#Learning to use cURL to fetch api sample from weather in London.

#Returns api response in JSON 
#curl "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"


#-write-out flag can be used to write the HTTP response code to the shell
#Here we get the http response at the end of the response, so we are getting near to what we want.
#curl --write-out "%{http_code}\n" "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"

#We can use the --output flag that allows to write the output of the cURL command to a file instead of stdout. 
#Here we write the output to a file called output.txt.

#curl --write-out "%{http_code}\n" "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22" --output output.txt

#The last thing we want to do is to remove the transfer report for cURL that was present in the previous output.
#This will only give us the HTTP response code in return wich should be 200.
#curl --write-out "%{http_code}\n" "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22" --output output.txt --silent

#Now we want to write all this as a bash script, this script will write the output of the cURL command to a variable and then prints the value of the cariable to the shell.
HTTP_CODE=$(curl --write-out "%{http_code}\n" "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22" --output output.txt --silent)
#We use echo to call the function callen HTTP_CODE to show us what it stores. This will be shows in the console.
echo $HTTP_CODE
