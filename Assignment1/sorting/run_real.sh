#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=/user/dkrishna/wordcount/shakespeare.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment1/sorting/output

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
 -D map.output.key.field.separator=, \
 -D mapred.reduce.tasks=27 \
 -D stream.num.map.output.key.fields=2 \
 -D mapred.text.key.partitioner.option=-k1,1 \
 -files $MAPPER,$COMBINER,$REDUCER \
 -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
 -mapper $MAPPER \
 -combiner $COMBINER \
 -reducer $REDUCER \
 -input $INPUTFILE \
 -output $OUTPUTFILE


# hadoop fs -getmerge $OUTPUTFILE result.txt
# hadoop fs -rm -r $OUTPUTFILE
