#!/usr/bin/env python2

import scholarly
import pickle
import sys

#hard number of top results to check only check top
NUM_CHECK = 1

class pickle_scholar():

	def __init__(self, pkl_f_name):
		"""open pickle file and put in local variable
		"""
		self.pkl_f_name = pkl_f_name
		
		try:
			f = open(pkl_f_name, "r+")
			self.scholar_dict = pickle.load(f)
		except EOFError:
			self.scholar_dict = {}
			print "pickle has no dictionary, one created"
		except:
			print "Unexpected error:", sys.exc_info()[0]
			sys.exit()
		#close after loading pickle
		f.close()


	def add_entry(self, title, authors):
		""" using title and author check and add to the pickle 
		file some rudimentary filtering heuristics included
		"""		
		if self._check_entry(title):
			print("{} is already in the dictionary".format(title))
			return 0

		#candidate publication null if fail
		pub = self._check_scholarly(title, authors)

		if not pub:
			print("{} has no scholarly match".format(title))
			return 0

		#add to pickle
		try:
			publication = {"publication_object": pub}
			publication["read"] = False

			self.scholar_dict[title] = publication
			f = open(self.pkl_f_name, "w")
			pickle.dump(self.scholar_dict, f)
			f.close()
			print("added: {}".format(title))

		except Exception as e:
			print "something went wrong: {}".format(e)
			print "for title: {}".format(title)




	def _check_entry(self, title):
		''' check if the title is in scholar pickle'''
		if title in self.scholar_dict.keys():
			return 1
		else:
			return 0

	def _check_scholarly(self, title, authors_list):
		"""do a check on sholarly for  title
		currently only check first entry
		"""
		#TODO check if you can find query list length

		search_query = scholarly.search_pubs_query(title)
		try:
			result = next(search_query)
			if self._author_check(result, authors_list):
				return result
			else:
				return None

		except Exception as e:
			print("no results, exception: {}".format(e))


	def _author_check(self, publication, authors):
		''' check publication for authors '''
		return 1




def main():

	f_title_auth = open("title_auth_spencer.pkl", "rb")
	title_auth_list = pickle.load(f_title_auth)

	print("total entires: {0}".format(len(title_auth_list)))

	PS = pickle_scholar("scholar_dict.pkl")
	
	break_point = 5
	for title_auth in title_auth_list:
		PS.add_entry(title_auth[0], title_auth[1])

		if break_point <= 0:
			break
		#break_point -= 1





if __name__ == '__main__':
	main()