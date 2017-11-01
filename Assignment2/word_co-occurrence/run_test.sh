#!/bin/bash
echo "Simulating map-reduce..."

MAPPER=mapper.py
REDUCER=reducer.py
REDUCER1=reducer_1.py
REDUCER2=reducer_2.py
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

# cat $INPUTFILE | python $MAPPER | sort -k1,1 | python $REDUCER1 | sort -k1,1 | python $REDUCER2
cat $INPUTFILE | python $MAPPER | sort -k1,1 | python $REDUCER | sort -k1,1
