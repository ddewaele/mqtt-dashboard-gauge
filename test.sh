#!/bin/ksh
file="./data.csv"
while read line
do
	#echo "$line"
	#mosquitto_pub -h broker.mqttdashboard.com -t testGaugeTopic/liveData --qos 2 -m 
	echo $line | awk '{split($0,a,","); system("mosquitto_pub -h broker.mqttdashboard.com -t testGaugeTopic/liveData --qos 2 -m \"" a[8] "|" a[7] "|100\"")}' 
done <"$file"
