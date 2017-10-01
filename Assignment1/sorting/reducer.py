#!/usr/bin/env python
#reducer.py

import string
import sys

def main(_):
	prev_key = None
	tot_count = 0
	for line in sys.stdin:
		line = line.rstrip()
		key = line

		if prev_key == None:
			prev_key = key
			continue
		if prev_key == key:
			continue
		if prev_key != key:
			print ('{key}'.format(key=prev_key))
			prev_key = key
	print ('{key}'.format(key=prev_key))


if __name__== '__main__':
    main(None)