#!/bin/bash

# Fetch temperature from Gjøvik

# Get current hour
hour=$(date +"%H":"00")
first_hour=$(date +"%H":"00" -d '1 hours')
second_hour=$(date +"%H":"00" -d '2 hours')

# Api url
api_url="https://api.met.no/weatherapi/locationforecast/2.0/classic?lat=60.795&lon=10.691"

#Get date and hour from date
hour_time=$(curl -s "$api_url" | grep from | grep -Eo "[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}" > time.txt)

#Fetch weather data and extract the temperature in Gjøvik
temperature_gjovik=$(curl -s "$api_url" | grep temperature |  grep -Eo "[-]?[0-9].[0-9]" > temperature.txt)

echo "Temperature Gjøvik:$temperature_gjovik"
echo "$hour_time"
