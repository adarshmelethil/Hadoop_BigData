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
			if len(word) == 0: continue
			
			key1 = 0 if word[0] < 'a' else word[0]
			key2 = word
			value = word
			print('{key1}\t{key2}\t{value}'.format(key1=key1, key2=key2, value=value))

	

if __name__ == "__main__":
	main()
