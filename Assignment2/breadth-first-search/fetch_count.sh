#!/bin/bash
echo "Fetching count..."

VARIABLENAME=countname
FILENAME=mapreduce_output.txt
COUNTNAME=nonblack_count

while getopts "v:f" opt; do
	case $opt in
		v) MAPPER=$OPTARG;;
		f) REDUCER=$OPTARG;;
	esac
done

cat $FILENAME | grep $COUNTNAME | cut -d '=' -f 2 
