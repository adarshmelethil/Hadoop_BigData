#!/usr/bin/env python
#mapper.py

import string
import sys
import random
import argparse

FLAGS = None


def main(_):
	for line in sys.stdin:
		file_name = os.environ['mapreduce_map_input_file']
		line = line.strip()
		line = line.lower()
		words = line.split()
		for word in words:
			for c in string.punctuation:
				word = word.replace(c,"")

			key = word
			value = file_name
			print('{key}\t{value}'.format(key=key,value=value))
			

if __name__=='__main__':
	parser = argparse.ArgumentParser(description='Mapper to calculate n-gram')


	FLAGS, unparsed = parser.parse_known_args()
	main(unparsed)