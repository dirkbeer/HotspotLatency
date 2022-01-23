#!/bin/bash
date | tr '\n' ' ' >> /home/dirk/helium_latency.txt

nmap -Pn -p 44158 68.8.113.7 | grep "Host is" | \
sed 's/Host is up (//' | sed 's/s latency).//' | \
sed 's/\n/ /' \
>> /home/dirk/helium_latency.txt

