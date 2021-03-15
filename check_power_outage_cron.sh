#!/bin/bash

# Scan Networks and checks for "ESPWebServer" or the name of your Access Point.
result=$(sudo iw dev wlan0 scan | grep "SSID: ESPWebServer");
state="NA";

if [ -z "$result" ]
then
	# Replace "power_outage" and "YOUR_KEY"
	curl -X POST https://maker.ifttt.com/trigger/power_outage/with/key/YOUR_KEY;
	state="Outage";
else
	state="No Outage";
fi

# Optionally log the state in the server. (Make sure you have the right directory below, or the logs might not get written.)
echo $(date) - $state >> /home/pi/Logs.txt;