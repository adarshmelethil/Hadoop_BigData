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
			word = word.lower()
			key = word.lower()
			print('{key}'.format(key=key))

if __name__ == "__main__":
	main()