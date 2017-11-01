#!/bin/bash

n=5

# continue until $n equals 5
while [ $n -ge 0 ]
do
	echo "Welcome $n times."
	n=$(( n-1 ))	 # increments $n
done
