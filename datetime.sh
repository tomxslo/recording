#! /bin/bash

read -p "Please enter channels: " channels
read -p "Please enter duration: " duration
read -p "Please enter filename: " filename
read -p "Please enter date in format: 05/10/2017 12:09: " -e -i "05/10/2017 12:09" datetime
cd /opt/SS/
echo Recording will start for chanenl: $channels for: $duration min with filename: $filename at $datetime
read -r -p "Are you sure? [Y/n]" response
 response=${response,,} # tolower
 if [[ $response =~ ^(yes|y| ) ]] | [ -z $response ]; then
 ./StreamCapture --channels $channels --duration $duration --filename $filename --datetime "$datetime" >./logs/datetime$filename &
else
 echo "Recording aborted"
 fi
