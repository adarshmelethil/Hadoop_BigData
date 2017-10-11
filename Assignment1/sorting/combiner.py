#!/usr/bin/env python
#reducer.py

import string
import sys

def main(_):
	prev_key1 = None
	prev_key2 = None
	prev_value = None
	tot_count = 0
	for line in sys.stdin:
		line = line.rstrip()
		key, value = line.split('\t')
		key1, key2 = key.split(',')

		if prev_value == None:
			prev_value = value
			prev_key1 = key1
			prev_key2 = key2
			continue
		if prev_key2 == key2:
			continue
		if prev_key2 != key2:
			print('{key1},{key2}\t{value}'.format(key1=prev_key1, key2=prev_key2, value=prev_value))
			prev_value = value
			prev_key1 = key1
			prev_key2 = key2
	print ('{key1},{key2}\t{value}'.format(key1=prev_key1, key2=prev_key2, value=prev_value))


if __name__== '__main__':
    main(None)