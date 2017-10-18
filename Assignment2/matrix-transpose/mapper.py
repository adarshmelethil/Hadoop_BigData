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
		row, col, value = line.split(",")
		key = "{col}\t{row}".format(row=row,col=col)
		print("{key}\t{value}".format(key=key, value=value))

	

if __name__ == "__main__":
	main()