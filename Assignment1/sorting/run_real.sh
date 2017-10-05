#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=/user/dkrishna/wordcount/shakespeare.txt
OUTPUTFILE=/user/adarsh.melethil/output

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
echo "Combiner: $COMBINER"
echo "Input file: $INPUTFILE"
echo "Output file: $OUTPUTFILE"

hadoop jar $JARFILE \
 -D mapred.reduce.tasks=0 \
 -files $MAPPER,$COMBINER,$REDUCER \
 -mapper $MAPPER \
 -input $INPUTFILE \
 -output $OUTPUTFILE

# -D mapred.text.key.partitioner.option=-k1,1 \
#  -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
#  -reducer $REDUCER \
#  -combiner $COMBINER \

hadoop fs -getmerge $OUTPUTFILE result.txt
# hadoop fs -rm -r $OUTPUTFILE
