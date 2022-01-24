#!/bin/bash


#
# traceroute -d -T -p 44158 68.8.113.7
#

date | tr '\n' ' ' >> /home/dirk/hotspot_latency.txt

# buffalo
nmap -Pn -p 44158 99.171.178.180 | grep "Host is" | \
sed 's/Host is up (//' | sed 's/s latency).//' | \
tr '\n' ' ' \
>> /home/dirk/hotspot_latency.txt

# beaver
nmap -Pn -p 44158 68.8.113.7 | grep "Host is" | \
sed 's/Host is up (//' | sed 's/s latency).//' | \
tr '\n' ' ' \
>> /home/dirk/hotspot_latency.txt

# spider
nmap -Pn -p 44158 68.107.0.69 | grep "Host is" | \
sed 's/Host is up (//' | sed 's/s latency).//' \
>> /home/dirk/hotspot_latency.txt
