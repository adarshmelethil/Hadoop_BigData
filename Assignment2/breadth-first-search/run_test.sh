#!/bin/bash
echo "Simulating map-reduce..."

MAPPER=mapper.py
REDUCER=reducer.py
COMBINER=combiner.py
INPUTFILE=in.txt
ITER=3

while getopts ":m:r:i:t:" opt; do
	case $opt in
		m) MAPPER=$OPTARG;;
		r) REDUCER=$OPTARG;;
		i) INPUTFILE=$OPTARG;;
		t) ITER=$OPTARG;;
	esac
done

echo "Maper: $MAPPER"
echo "Rducer: $REDUCER"
echo "Input file: $INPUTFILE"
echo "ITER: $ITER"

if [[ $ITER -eq 1 ]]; then
	cat $INPUTFILE | python $MAPPER | sort -k1,1 | python $REDUCER
elif [[ $ITER -eq 2 ]]; then
	cat $INPUTFILE | python $MAPPER | sort -k1,1 | python $REDUCER | python $MAPPER | sort -k1,1 | python $REDUCER
elif [[ $ITER -eq 3 ]]; then
	cat $INPUTFILE | python $MAPPER | sort -k1,1 | python $REDUCER | python $MAPPER | sort -k1,1 | python $REDUCER | python $MAPPER | sort -k1,1 | python $REDUCER 
fi


# i=1
# INITINPUT="$(cat $INPUTFILE)"
# echo "${INITINPUT}"
# while [[ $i -le $ITER ]]
# do
# 	echo "${INITINPUT}"
# 	echo "---"
# 	echo"$(echo ${INITINPUT} | python $MAPPER | sort -k1,1 | python $REDUCER)"
# 	((i = i + 1))
# done




