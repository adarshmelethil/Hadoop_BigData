#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=/user/dkrishna/wordcount/shakespeare.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment1/sorting/output
FILE=hdfs_PartsInfo.txt

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

hadoop jar $JARFILE  \
-D map.output.key.field.separator=. \
-D stream.num.map.output.key.fields=2 \
-D mapred.reduce.tasks=27 \
-D mapred.text.key.partitioner.option=-k1,1 \
-files $MAPPER,$COMBINER,$REDUCER \
-mapper $MAPPER \
-combiner $COMBINER \
-reducer $REDUCER \
-input $INPUTFILE \
-output $OUTPUTFILE \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner 

# -D stream.num.map.output.key.fields=2 \
# -D stream.map.output.field.separator=. \



# hadoop fs -getmerge $OUTPUTFILE result.txt
# hadoop fs -rm -r $OUTPUTFILE

echo "Checking head/tail of hadoop outputfile..."


echo "" > $FILE

for (( num=0; num<27; num++ ))
do
	foo=$(printf "%05d" $num)
	FIRST_ENTRY=$(hadoop fs -cat $OUTPUTFILE/part-$foo | head -n1)
	LAST_ENTRY=$(hadoop fs -cat $OUTPUTFILE/part-$foo | tail -n1)
	echo "$OUTPUTFILE/part-$foo: $FIRST_ENTRY - $LAST_ENTRY" >> $FILE
done

