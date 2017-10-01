#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
INPUTFILE=/user/dkrishna/wordcount/shakespeare.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment1/sub-sample/output

while getopts "m:r:i:o" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
		o) OUTPUTFILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Input file: $INPUTFILE"
echo "Output file: $OPTARG"

hadoop jar $JARFILE \
-files $MAPPER,$REDUCER \
-mapper $MAPPER \
-input $INPUTFILE \
-output $OUTPUTFILE \
-D mapred.reduce.tasks=0