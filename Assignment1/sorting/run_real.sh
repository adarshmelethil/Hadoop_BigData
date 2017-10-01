#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
INPUTFILE=/user/dkrishna/wordcount/shakespeare.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment1/sorting/output

while getopts "m:r:i:o" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		r) REDUCER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
		o) OUTPUTFILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Reducer: $REDUCER"
echo "Input file: $INPUTFILE"
echo "Output file: $OPTARG"

hadoop jar $JARFILE \
-files $MAPPER,$REDUCER \
-mapper $MAPPER \
-reducer $REDUCER \
-input $INPUTFILE \
-OUTPUTFILE $OUTPUTFILE