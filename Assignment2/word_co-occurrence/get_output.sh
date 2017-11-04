#!/bin/bash
echo "Fetching result..."

OUTPUTFILE=/user/adarsh.melethil/Assignment2/word_co-occurrence/output
echo "File $OUTPUTFILE"

hadoop fs -getmerge $OUTPUTFILE result.txt
