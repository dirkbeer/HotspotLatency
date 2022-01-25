#!/bin/bash

sleep 15s

date | tr '\n' ' ' >> /home/dirk/hotspot_latency2.txt

# buffalo
/usr/bin/time -f "%e" nc -z 99.171.178.180 44158 \
2>&1 | tr '\n' ' ' \
>> /home/dirk/hotspot_latency2.txt 2>&1

# beaver
/usr/bin/time -f "%e" nc -z 68.8.113.7 44158 \
2>&1 | tr '\n' ' ' \
>> /home/dirk/hotspot_latency2.txt 2>&1

# spider
/usr/bin/time -f "%e" nc -z 68.107.0.69 44158 \
>> /home/dirk/hotspot_latency2.txt 2>&1

