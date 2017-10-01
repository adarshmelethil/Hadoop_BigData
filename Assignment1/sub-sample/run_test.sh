#!/bin/bash
echo "Simulating map-reduce..."

MAPPER=mapper.py
INPUTFILE=in.txt

while getopts ":m:r:i:" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		r) REDUCER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Input file: $INPUTFILE"

cat $INPUTFILE | python $MAPPER | sort -k1,1




