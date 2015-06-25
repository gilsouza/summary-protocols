#!/bin/bash

PCAPS=pcap/*.pcap

for f in $PCAPS
do
	./protocols_summary.sh $f
done
