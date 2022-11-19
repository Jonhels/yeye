#!/bin/bash

#Goal of this project is to fetch data api.met.no about the weather forcast from cities of Gjøvik, Oslo, Trondheim, Bergen and Tromsø.

#It will extract the temperature for the current hour, the next hour and the hour after that. 

#It extracts the next precipiation forecast.

#It creates a new directory/folder (spesific to this session) where it will store the files with the meterological data.

#For each city it creates an information file with 6 lines.
#Line 1: Name of the city, 
#Line 2: The temperature forecast for the  current hour.
#Line 3: Temperature forecast for the next hour.
#Line 4: Temperature forecast for the next after that.
#Line 5: The precipitation forecast.
#The date and time when the meterological data has been scraped.

#Create scraping script first.


curl -X GET --header 'Accept: application/json' 'https://api.met.no/weatherapi/airqualityforecast/0.1/?lat=60.795429&lon=10.691630'
