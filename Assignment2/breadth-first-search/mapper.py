#!/usr/bin/env python
#mapper.py

import string
import sys
import random
import argparse

def main():
	max_node = -1
	
	for line in sys.stdin:
		line = line.strip()
		line = line.lower()
		node, info = line.split("\t")
		connections, distance, is_visited, source = info.split("|")
		if max_node == -1 or max_node < node:
			max_node = node
		if is_visited == "gray":
			# print("{key}\t{value}".format(key=key, value=value))
			connections_list = list(map(int, connections.split(",")))
			for connection in connections_list:
				key = str(connection)
				value = "|".join(["null", str(int(distance)+1), "gray", node])
				print("{key}\t{value}".format(key=key, value=value))
			key = node
			value = "|".join([connections, distance, "black", source])
			# sys.stderr.write("reporter:counter:BreadthFirstSearch,black_count,1")
		else:
			key = node
			value = "|".join([connections, distance, is_visited, source])
		print("{key}\t{value}".format(key=key, value=value))
		# print("{} - {}+{}+{}+{}".format(node, connections, distance, is_visited, isSource))

		# key = "{col}\t{row}".format(row=row,col=col)
		# print("{key}\t{value}".format(key=key, value=value))

	# current_max_node = sys.stderr.read("reporter:status:")
	# if current_max_node == None or current_max_node < max_node:
	# 	sts.stderr.write("reporter:status:"+str(max_node))
	

if __name__ == "__main__":
	main()