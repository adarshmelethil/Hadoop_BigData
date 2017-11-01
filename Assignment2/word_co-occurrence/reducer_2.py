#!/usr/bin/env python
#reducer.py

import string
import sys
import random
import argparse

def main():
	item_N = 0
	cur_item_1, cur_item_2 = None, None
	for line in sys.stdin:
		line = line.strip()
		line = line.lower()
		item_1, item_2, count = line.split("\t")
		
		if cur_item_1 == None:
			cur_item_1 = item_1
			cur_item_2 = item_2
			item_N = int(count)

		elif cur_item_1 == item_1:
			value = int(count) / item_N
			cur_item_2 = item_2
			print("{},{}\t{:f}".format(cur_item_1, cur_item_2, value))
			
		elif cur_item_1 != item_1:
			cur_item_1 = item_1
			cur_item_2 = item_2
			item_N = int(count)

	

if __name__ == "__main__":
	main()