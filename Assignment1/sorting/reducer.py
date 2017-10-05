#!/usr/bin/env python
#reducer.py

import string
import sys

def main(_):
	prev_value = None
	tot_count = 0
	for line in sys.stdin:
		line = line.rstrip()
		value = line

		if prev_value == None:
			prev_value = value
			continue
		if prev_value == value:
			continue
		if prev_value != value:
			print ('{value}'.format(value=prev_value))
			prev_value = value
	print ('{value}'.format(value=prev_value))


if __name__== '__main__':
    main(None)