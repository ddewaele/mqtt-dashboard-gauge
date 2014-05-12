##MQTT Dashboard

![](https://dl.dropboxusercontent.com/u/13246619/mqtt/gauge/gauge.png)

Small technology showcase using :

- [The Eclipse Paho MQTT Javascript client library](http://www.eclipse.org/paho/)
- [ChartJS](http://chartjs.devexpress.com/)


###Step 1 : Change this index.html and add your MQTT broker connection params:

	var client = new Messaging.Client('broker.mqttdashboard.com', 8000, 'myclientid1234');
   
###Step 2 : Subscribe to a topic

    client.subscribe('testGaugeTopic/#', {qos: 2});  

###Step 3 : Start sending messages

Send some random data to the topic:

    for i in {1..100}
    do
        mosquitto_pub -h broker.mqttdashboard.com -t testGaugeTopic/liveData --qos 2 -m "$(((RANDOM%120)+1))"
        sleep 1 
    done    
