#!/bin/sh
cd /src
while true  
do  
  /usr/bin/python3 -u /src/influxspeedtest.py
  sleep 600  
done
