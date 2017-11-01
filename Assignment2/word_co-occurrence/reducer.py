#!/usr/bin/env python
#reducer.py

import string
import sys
import random
import argparse

def main():
	item_N = 0
	cur_item_1, cur_item_2 = None, None
	pair_counter = 0
	item_pair_list = []
	for line in sys.stdin:
		line = line.strip()
		line = line.lower()
		item_1, item_2 = line.split("\t")
		
		if cur_item_1 == None:
			cur_item_1 = item_1
			cur_item_2 = item_2
			pair_counter = 1
			item_N = 1
		elif cur_item_1 == item_1:
			if cur_item_2 == item_2:
				pair_counter += 1
			else:
				item_pair_list.append({"key":"{}\t{}".format(cur_item_1, cur_item_2), "value": pair_counter})
				cur_item_2 = item_2
				pair_counter = 1

			item_N += 1
		elif cur_item_1 != item_1:
			print( "{}\t{}\t{:f}".format(cur_item_1, cur_item_2, (pair_counter/item_N)) )

			for pair in item_pair_list:
				print( "{}\t{:f}".format(pair["key"], (pair["value"]/item_N)) )
			cur_item_1 = item_1
			cur_item_2 = item_2
			pair_counter = 1
			item_N = 1
			item_pair_list = []

	# print("{}\t{}\t{}".format(cur_item_1, cur_item_2, pair_counter))
	# print("{}\t{}\t{}".format(cur_item_1, 0, item_N))
	print( "{}\t{}\t{:f}".format(cur_item_1, cur_item_2, (pair_counter/item_N)) )
	for pair in item_pair_list:
		print("{}\t{:f}".format(pair["key"], (pair["value"]/item_N)))

	

if __name__ == "__main__":
	main()