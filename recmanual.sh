#! /bin/bash
read -p "Please enter channels: " channels
read -p "Please enter duration: " duration
read -p "Please enter filename: " filename
cd /opt/SS/
echo Recording will start for chanenl: $channels for: $duration min with filename: $filename
read -r -p "Are you sure? [Y/n]" response
 response=${response,,} # tolower
 if [[ $response =~ ^(yes|y| ) ]] | [ -z $response ]; then
 ./StreamCapture --channels $channels --duration $duration --filename $filename >./logs/manual$filename &
else
 echo "Recording aborted"
 fi
