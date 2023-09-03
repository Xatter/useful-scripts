#!/usr/bin/env bash
# Wake-On-Lan Magic Packet using netcat in bash

# MAC_ADDRESS="F0:2F:74:B2:46:77"
# MAC_ADDRESS="f0:2f:74:b2:46:76"

MAC_ADDRESSES=(
  "F0:2F:74:B2:46:77"
  "F0:2F:74:B2:46:76"
)

BROADCAST_ADDRESS="255.255.255.255"
PORT_NUMBER="4000"

for MAC_ADDRESS in "${MAC_ADDRESSES[@]}"; do
	echo "Waking $MAC_ADDRESS ..."
	echo -e $(echo $(printf 'f%.0s' {1..12}; printf "$(echo $MAC_ADDRESS | sed 's/://g')%.0s" {1..16}) | sed -e 's/../\\x&/g') | nc -w1 -u -b $BROADCAST_ADDRESS $PORT_NUMBER
done
