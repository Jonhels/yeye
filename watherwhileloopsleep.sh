#!/bin/bash   

#The COUNTER variable is used to count the number of API calls to be executed before exiting from the while loop.
COUNTER=0 

#Sleep command to control the number of calls to a third party API.
#This While loop goes through a COUNTER variable and executes an api call every 10 seconds to fetch api data about the london weather. It sleeps for 10 seconds each round to stop the calls from going to fast and returning an error from the API provider.

while [ $COUNTER -lt 3 ]; do
    printf "\n\n### Executing API call number $COUNTER ('date) ###\n\n"

#cURL is used to perform the GET request against the API endpoint.
    curl "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"
    
#We increment the COUNTER variable using the arthimetic operator $(()).    
    COUNTER=$(($COUNTER+1))
    
#At every iteration of the while loop we suspend the script for 10 seconds.
    sleep 10

done