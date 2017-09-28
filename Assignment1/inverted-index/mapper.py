#!/usr/bin/env python
#mapper.py

import string
import sys
import random
import argparse

FLAGS = None


def main(_):
	for line in sys.stdin:
		previous_n_words = []
		line = line.strip()
		line = line.lower()
		words = line.split()
		for word in words:
			for c in string.punctuation:
				word=word.replace(c,"")

			if len(previous_n_words) == FLAGS.word_level:
				previous_n_words = [previous_n_words[i] for i in range(1, len(previous_n_words))]

			previous_n_words.append(word)
			if len(previous_n_words) < FLAGS.word_level:
				continue
			key = ','.join(previous_n_words)
			print('{key}\t{value}'.format(key=key,value=1))
			

if __name__=='__main__':
	parser = argparse.ArgumentParser(description='Mapper to calculate n-gram')
	parser.add_argument('-n','--word_level', action='store', type=int, default=2, nargs=1)


	FLAGS, unparsed = parser.parse_known_args()
	main(unparsed)