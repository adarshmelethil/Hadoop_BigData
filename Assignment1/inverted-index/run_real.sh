#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=reducer.py
INPUTFILE=/user/dkrishna/wordcount
OUTPUTFILE=/user/adarsh.melethil/Assignment1/inverted-index/output

while getopts "m:r:c:i:o" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		r) REDUCER=$OPTARG;;
		c) COMBINER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
		o) OUTPUTFILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Reducer: $REDUCER"
echo "COMBINER: $COMBINER"
echo "Input file: $INPUTFILE"
echo "Output file: $OUTPUTFILE"

hadoop jar $JARFILE \
-files $MAPPER,$REDUCER \
-mapper $MAPPER \
-reducer $REDUCER \
-combiner $COMBINER \
-input $INPUTFILE \
-output $OUTPUTFILE

hadoop fs -getmerge $OUTPUTFILE result.txt
# hadoop fs -rm -r $OUTPUTFILE