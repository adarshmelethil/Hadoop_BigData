#!/usr/bin/env python
#reducer.py

import string
import sys
import random
import argparse

def main():
	item_N = 0.0
	cur_item_1, cur_item_2 = None, None
	pair_counter = 0.0
	item_pair_list = []
	for line in sys.stdin:
		line = line.strip()
		line = line.lower()
		item_1, item_2 = line.split("\t")
		
		if cur_item_1 == None:
			cur_item_1 = item_1
			cur_item_2 = item_2
			pair_counter = 1.0
			item_N = 1.0
		elif cur_item_1 == item_1:
			if cur_item_2 == item_2:
				pair_counter += 1.0
			else:
				item_pair_list.append({"key":"{item1}\t{item2}".format(item1=cur_item_1, item2=cur_item_2), "value": pair_counter})
				cur_item_2 = item_2
				pair_counter = 1.0

			item_N += 1.0
		elif cur_item_1 != item_1:
			value = (pair_counter/item_N)
			print( "{item1}\t{item2}\t{value:f}".format(item1=cur_item_1, item2=cur_item_2, value=value))
			print("{counter}/{N}={value}".format(counter=pair_counter, N=item_N, value=value))
			for pair in item_pair_list:
				value = (pair["value"]/item_N)
				print( "{items}\t{value:f}".format(items=pair["key"], value=value))
				print("{counter}/{N}={value}".format(counter=pair["value"], N=item_N, value=value))
			cur_item_1 = item_1
			cur_item_2 = item_2
			pair_counter = 1.0
			item_N = 1.0
			item_pair_list = []

	# print("{}\t{}\t{}".format(cur_item_1, cur_item_2, pair_counter))
	# print("{}\t{}\t{}".format(cur_item_1, 0, item_N))
	value=(pair_counter/item_N)
	print( "{item1}\t{item2}\t{value:f}".format(item1=cur_item_1, item2=cur_item_2, value=value))
	print("{counter}/{N}={value}".format(counter=pair_counter, N=item_N, value=value))
	for pair in item_pair_list:
		value = (pair["value"]/item_N)
		print("{items}\t{value:f}".format(items=pair["key"], value=value))
		print("{counter}/{N}={value}".format(counter=pair["value"], N=item_N, value=value))

	

if __name__ == "__main__":
	main()