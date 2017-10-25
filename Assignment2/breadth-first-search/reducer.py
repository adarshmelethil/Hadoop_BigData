#!/usr/bin/env python
#reducer.py

import string
import sys
import random
import argparse

def main():
	cur_node, cur_connections, cur_distance, cur_is_visted, cur_source = None, None, None, None, None 
	for line in sys.stdin:
		line = line.strip()
		line = line.lower()
		node, info = line.split("\t")
		connections, distance, is_visited, source = info.split("|")
		if cur_node == None:
			cur_node = node
			cur_connections = connections
			cur_distance = distance
			cur_is_visted = is_visited
			cur_source = source
			continue
		if cur_node == node:
			if cur_connections == None:
				cur_connections = connections
			if cur_distance > distance:
				cur_distance = distance
				cur_source = source
			if cur_is_visted == "gray":
				if is_visited == "black":
					cur_is_visted = is_visited
			elif cur_is_visted == "white":
				if is_visited == "black" or is_visited == "gray":
					cur_is_visted = is_visited
			continue
		if cur_node != node:
			key = cur_node
			value = "|".join([cur_connections, cur_distance, cur_is_visted, cur_source])
			print("{key}\t{value}".format(key=key, value=value))
			cur_node = node
			cur_connections = connections
			cur_distance = distance
			cur_is_visted = is_visited
			cur_source = source


	key = cur_node
	value = "|".join([cur_connections, cur_distance, cur_is_visted, cur_source])
	print("{key}\t{value}".format(key=key, value=value))

	

if __name__ == "__main__":
	main()