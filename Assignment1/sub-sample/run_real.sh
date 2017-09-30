#!/bin/bash
echo "Simulating map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
INPUTFILE=/user/dkrishna/wordcount/shakespeare.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment1/sub-sample

while getopts "m:r:i" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		r) REDUCER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Input file: $INPUTFILE"

hadoop jar $JARFILE \


-D mapred.reduce.tasks=0