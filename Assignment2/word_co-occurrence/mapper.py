#!/usr/bin/env python
#mapper.py

import string
import sys
import random
import argparse

def main():
	for line in sys.stdin:
		line = line.strip()
		line = line.lower()
		items_list = line.split(" ")
		
		for i in range(len(items_list)-1):
			for j in range(i+1,len(items_list)):
				print("{item1}\t{item2}".format(item1=items_list[i], item2=items_list[j]))
				print("{item2}\t{item1}".format(item1=items_list[i], item2=items_list[j]))

	

if __name__ == "__main__":
	main()
