#!/bin/bash
echo "Checking head/tail of hadoop outputfile..."

OUTPUTFILE=/user/adarsh.melethil/Assignment1/sorting/output
FILE=hdfs_PartsInfo.txt

while getopts ":f:o:" opt; do
	case $opt in
		o) OUTPUTFILE=$OPTARG;;
		f) FILE=$OPTARG;;
	esac
done

echo "" > $FILE

for (( num=0; num<27; num++ ))
do
	foo=$(printf "%05d" $num)
	FIRST_ENTRY=$(hadoop fs -cat $OUTPUTFILE/part-$foo | head -n1)
	LAST_ENTRY=$(hadoop fs -cat $OUTPUTFILE/part-$foo | tail -n1)
	echo "$OUTPUTFILE/part-$foo: $FIRST_ENTRY - $LAST_ENTRY" >> $FILE
done
