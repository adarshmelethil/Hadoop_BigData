#!/bin/bash
echo "Checking head/tail of hadoop outputfile..."

OUTPUTFILE=/user/adarsh.melethil/Assignment1/sorting/output
FILE=hdfs_PartsInfo.txt

while getopts "o" opt; do
	case $opt in
		o) OUTPUTFILE=$OPTARG;;
	esac
done

echo "" > $FILE

for (( num=0; num<28; num++ ))
do
	foo=$(printf "%05d" $num)
	FIRST_ENTRY=$(hadoop fs -cat $OUTPUTFILE/part-$foo result.txt | head -n1)
	LAST_ENTRY=$(hadoop fs -cat $OUTPUTFILE/part-$foo result.txt | tail -n1)
	echo "$OUTPUTFILE/part-$foo: $FIRST_ENTRY - $LAST_ENTRY" >> $FILE
done
