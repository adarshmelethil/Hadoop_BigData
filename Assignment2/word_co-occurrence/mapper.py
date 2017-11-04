
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
				print("{}\t{}".format(items_list[i], items_list[j]))
				print("{}\t{}".format(items_list[j], items_list[i]))

	

if __name__ == "__main__":
	main()
