#!/bin/bash
echo "Running map-reduce..."

JARFILE=/home/instructor/hadoop-streaming/hadoop-streaming-2.7.3.jar


MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=/user/dkrishna/retail/retail.dat
OUTPUTFILE=/user/adarsh.melethil/Assignment2/word_co-occurrence/output

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

# 16,470 unique items
# 16,470/2 = 8235 -- 2 items per reducer
# per reducer |	 Num of reducers
# 2 			 8235.0
# 3 			 5490.0
# 5 			 3294.0
# 6 			 2745.0
# 9 			 1830.0
# 10 			 1647.0
# 15 			 1098.0
# 18 			 915.0
# 27 			 610.0
# 30 			 549.0
# 45 			 366.0
# 54 			 305.0
# 61 			 270.0
# 90 			 183.0
# 122 			 135.0
# 135 			 122.0
# 183 			 90.0
# 270 			 61.0
# 305 			 54.0
# 366 			 45.0
# 549 			 30.0
# 610 			 27.0
# 915 			 18.0
# 1098 			 15.0
# 1647 			 10.0
# 1830 			 9.0
# 2745 			 6.0
# 3294 			 5.0
# 5490 			 3.0
# 8235 			 2.0


# 183 reducers, with 90 items per reducer
hadoop jar $JARFILE -D stream.num.map.output.key.fields=2 -D mapred.reduce.tasks=183 -mapper $MAPPER -reducer $REDUCER -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner -file ./$MAPPER -file ./$REDUCER  -input $INPUTFILE -output $OUTPUTFILE


