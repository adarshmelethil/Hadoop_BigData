#!/bin/bash
echo "Fetching count..."

VARIABLENAME=countname
FILENAME=in_shell.txt

while getopts "v:f" opt; do
	case $opt in
		v) MAPPER=$OPTARG;;
		f) REDUCER=$OPTARG;;
	esac
done

cat $FILENAME | cut -d '=' -f 2 
