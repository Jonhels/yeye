#!/bin/bash

# Get tomorrow's date in YYYY-MM-DD format
today=$(date --date=tomorrow +%Y-%m-%d)

# Api url
api_url="https://api.met.no/weatherapi/sunrise/2.0?date=${today}&offset=+02:00&lat=60.795&lon=10.691"

# Fetch weather data and extract the time HH:MM:SS of the sunrise
sunrise_time=$(curl -s "$api_url" | grep sunrise | grep -Eo "[0-9]{2}:[0-9]{2}:[0-9]{2}")

echo "Sunrise time:$sunrise_time"
