#!/usr/bin/env python
#reducer.py

import string
import sys


def main(_):
	prev_key = None
	tot_count = 0
	for line in sys.stdin:
		# line = line.strip()
		key,count = line.split('\t')
		if prev_key==None:
			prev_key=key
			tot_count=int(count)
			continue
		if prev_key==key:
			tot_count=tot_count+int(count)
			continue
		if prev_key!=key:
			print ('{key}\t{value}'.format(key=prev_key,value=tot_count))
			prev_key=key
			tot_count=int(count)
	print ('{key}\t{value}'.format(key=prev_key,value=tot_count))


if __name__=='__main__':
    main(None)