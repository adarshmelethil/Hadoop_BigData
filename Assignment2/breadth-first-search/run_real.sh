#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=/user/adarsh.melethil/Assignment2/breadth-first-search/in.txt
OUTPUTFILE=/user/adarsh.melethil/Assignment2/breadth-first-search/output
FILE=hdfs_PartsInfo.txt

HADOOPRESPONSE=mapreduce_output.txt
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


OUTPUTFILE0=/user/adarsh.melethil/Assignment2/breadth-first-search/output0
OUTPUTFILE1=/user/adarsh.melethil/Assignment2/breadth-first-search/output1
OUTPUTFILE2=/user/adarsh.melethil/Assignment2/breadth-first-search/output2

ALTERNATE=0

NONBLACKCOUNT=1

hadoop jar $JARFILE -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $INPUTFILE -output $OUTPUTFILE0
# hadoop jar $JARFILE -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $OUTPUTFILE0/part-00000 -output $OUTPUTFILE1
# hadoop jar $JARFILE -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $OUTPUTFILE1/part-00000 -output $OUTPUTFILE2


# while [ $NONBLACKCOUNT -gt 0 ];
# do 
# 	if [ $ALTERNATE -eq 0 ]
# 	then
# 		echo "USING OUTPUT0"
# 		hadoop jar $JARFILE -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $INPUTFILE -output $OUTPUTFILE0 &> $HADOOPRESPONSE
# 		ALTERNATE=1
# 		INPUTFILE="$OUTPUTFILE0/part-00000"
# 		hadoop fs -rm -r $OUTPUTFILE1
# 	else
# 		echo "USING OUTPUT1"
# 		hadoop jar $JARFILE -mapper $MAPPER -reducer $REDUCER -file ./$MAPPER -file ./$REDUCER  -input $INPUTFILE -output $OUTPUTFILE1 &> $HADOOPRESPONSE
# 		ALTERNATE=0
# 		INPUTFILE="$OUTPUTFILE1/part-00000"
# 		hadoop fs -rm -r $OUTPUTFILE0
# 	fi
# 	echo "GETING NONBLACKCOUNT"
# 	NONBLACKCOUNT=$(cat $HADOOPRESPONSE | grep $COUNTNAME | cut -d '=' -f 2) 
# 	echo "NONBLACKCOUNT: $NONBLACKCOUNT"
# done 

