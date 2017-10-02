#!/usr/bin/env python
#reducer.py

import string
import sys


def main(_):
	prev_key = None
	tot_count = 0
	for line in sys.stdin:
		line = line.rstrip()
		key, oldValue = line.split('\t')

		if prev_key == None:
			prev_key = key
			newValue = [oldValue]
			continue
		if prev_key == key:
			newValue.append(oldValue)
			continue
		if prev_key != key:
			value = ','.join(newValue)
			print ('{key}\t{value}'.format(key=prev_key,value=value))
			prev_key = key
			tot_count = [oldValue]
	value = ','.join(newValue)
	print ('{key}\t{value}'.format(key=prev_key,value=value))


if __name__=='__main__':
    main(None)