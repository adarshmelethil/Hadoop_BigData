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
		words = line.split()
		for word in words:
			for c in string.punctuation:
				word = word.replace(c,"")
			value = word.lower()
			key = 0 if value[0] < 'a' else value[0]
			print('{key}\t{value}'.format(key=key, value=value))
	

if __name__ == "__main__":
	main()
