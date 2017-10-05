#!/usr/bin/env python
#reducer.py

import string
import sys


def main(_):
	prev_key = None
	for line in sys.stdin:
		line = line.rstrip()
		key, oldValue = line.split('\t')

		if prev_key == None:
			prev_key = key
			newValue = oldValue.split(',')
			continue
		if prev_key == key:
			if not oldValue in newValue:
				newValue.append(oldValue)
			continue
		if prev_key != key:
			value = ','.join(newValue)
			print ('{key}\t{value}'.format(key=prev_key,value=value))
			prev_key = key
			newValue = oldValue.split(',')
	value = ','.join(newValue)
	print ('{key}\t{value}'.format(key=prev_key,value=value))


if __name__=='__main__':
    main(None)