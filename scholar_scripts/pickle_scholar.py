#!/usr/bin/env python2

import scholarly
import pickle

NUM_CHECK = 5

class pickle_scholar():

	def __init__(self, pickle_file):
		'''open and load pickle'''
		self.pickle_file = pickle_file
		f = open(pickle_file, "rb")
		try:
			self.scholar_dict = pickle.load(f)
		except Exception as e:
			print e
			self.scholar_dict = {}
		pass

	def add_entry(self, title_authors):
		''' title and list of authors'''
		title = title_authors[0]
		authors = title_authors[1].split(',')
		
		if self._check_entry(title):
			print("{} is already in the dictionary".format(title))
			return 0

		if self._in_scholarly(title, authors):
			print("{} has not scholarly match".format(title))
			return 0

		print("{} was added".format(title))




	def _check_entry(self, title):
		''' check if the title is in scholar pickle'''
		if title in self.scholar_dict.keys():
			return 1
		else:
			return 0

	def _in_scholarly(self, title, authors):
		'''do a check on sholarly for  title'''
		#TODO check if you can find query list length
		i = 0
		search_query = scholarly.search_pubs_query(title)
		try:
			result = next(search_query)
			i += 1
			print(i)

		except Exception as e:
			print(" no results, exception: {}".format(e))
		
		while(i < NUM_CHECK):
			if self._author_check(result, authors):
				print result
			try:
				result = next(search_query)
				i += 1
				print(i)
			except Exception as e:
				print("exception after {} results: {}".format(i, e))
				return 0
		pass



	def _author_check(self, publication, authors):
		''' check publication for authors '''
		return 0




def main():

	f_title_auth = open("title_auth_spencer.pkl", "rb")
	title_auth_list = pickle.load(f_title_auth)

	print("total entires: {0}".format(len(title_auth_list)))

	PS = pickle_scholar("scholar_dict.pkl")
	PS.add_entry(title_auth_list[1])



if __name__ == '__main__':
	main()