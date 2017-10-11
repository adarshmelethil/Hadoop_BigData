#!/usr/bin/env python
#reducer.py

import string
import sys

def main(_):
	prev_key1 = None
	prev_key2 = None
	tot_count = 0
	for line in sys.stdin:
		line = line.rstrip()
		key1, key2 = line.split(',')

		if prev_key2 == None:
			prev_key1 = key1
			prev_key2 = key2
			continue
		if prev_key2 == key2:
			continue
		if prev_key2 != key2:
			print ('{key1},{key2}'.format(key1=key1, key2=key2))
			prev_key1 = key1
			prev_key2 = key2
	
	print ('{key1},{key2}'.format(key1=key1, key2=key2))


if __name__== '__main__':
    main(None)