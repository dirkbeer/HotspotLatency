#!/bin/bash

# using nmap and variables, doesn't yet get the latency

outfilename=hotspot_latency.txt
datetime=$(date | sed 's/\n//')

function get_hotspot_data () {
	hs=("$@")
	result=$(nmap -oG /dev/stdout -Pn -n -p ${hs[2]} -sV ${hs[1]} | grep Ports | sed 's/^.*Ports: //' | sed 's/Host is up\.//' |  sed 's/Host is up (//' | sed 's/s latency)\.//' | sed 's:/:\t:g')
	printf "$datetime\t${hs[0]}\t${hs[1]}\t$result\n" >> $outfilename
}

hs=(tadpole 68.8.112.183 44158)
get_hotspot_data "${hs[@]}"

hs=(buffalo 99.171.178.180 44158)
get_hotspot_data "${hs[@]}"

hs=(beaver 72.26.117.34 44158)
get_hotspot_data "${hs[@]}"

hs=(spider 72.26.117.34 44158)
get_hotspot_data "${hs[@]}"

# keep file size reasonable by only keeping a maximum number of lines
echo "$(tail -10000 hotspot_latency.txt)" > hotspot_latency.txt
