#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=/user/instructor/matrix/matrix.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment2/matrix-transpose/output

while getopts "m:r:c:i:o:f" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		r) REDUCER=$OPTARG;;
		c) COMBINER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
		o) OUTPUTFILE=$OPTARG;;
		f) FILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Reducer: $REDUCER"
echo "Combiner: $COMBINER"
echo "Input file: $INPUTFILE"
echo "Output file: $OUTPUTFILE"

hadoop jar $JARFILE -D stream.num.map.output.key.fields=2 -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $INPUTFILE -output $OUTPUTFILE


