#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=/user/adarsh.melethil/Assignment2/breadth-first-search/in.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment2/breadth-first-search/output
FILE=hdfs_PartsInfo.txt
COUNTNAME=nonblack_count

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

# hadoop jar $JARFILE -D stream.num.map.output.key.fields=2 -D mapred.text.key.partitioner.options=-k1,1 -D mapred.reduce.tasks=27 -mapper mapper.py -reducer reducer.py -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner -file ./mapper.py -file ./reducer.py  -input /user/dkrishna/wordcount/shakespeare.txt -output $OUTPUTFILE

NONBLACKCOUNT=1

OUTPUTFILE0=/user/adarsh.melethil/Assignment2/breadth-first-search/output0
OUTPUTFILE1=/user/adarsh.melethil/Assignment2/breadth-first-search/output1
ALTERNATE=0
while [$NONBLACKCOUNT -gt 0]
do 
	if [ALTERNATE -eq 0];  then
		hadoop jar $JARFILE -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $INPUTFILE -output $OUTPUTFILE0 &> mapreduce_output.txt
		ALTERNATE=1
		INPUTFILE=OUTPUTFILE0
		hadoop fs -rm -r $OUTPUTFILE1
	else
		hadoop jar $JARFILE -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $INPUTFILE -output $OUTPUTFILE1 &> mapreduce_output.txt
		ALTERNATE=0
		INPUTFILE=OUTPUTFILE1
		hadoop fs -rm -r $OUTPUTFILE0
	fi
	NONBLACKCOUNT=$(cat $FILENAME | grep $COUNTNAME | cut -d '=' -f 2) 

done 

