#!/bin/bash
echo "Simulating map-reduce..."

MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=in.txt

while getopts "m:r:i" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		r) REDUCER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Rducer: $REDUCER"
echo "Input file: $INPUTFILE"

cat $INPUTFILE | python $MAPPER | sort -k1,1 | python $REDUCER 




