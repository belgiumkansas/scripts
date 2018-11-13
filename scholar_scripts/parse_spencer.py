#!/usr/bin/env python3

from bs4 import BeautifulSoup
import scholarly
import pickle


file_html = open("html_spencer", "r")

data_html = file_html.read()

soup = BeautifulSoup(data_html, 'html.parser')

titles = soup.find_all("div", "pub")

title_author_list = []
test = 0

for hit in titles:
	test += 1
	i = 0
	for descendant in hit.descendants:
		#print(descendant.string)
		#print(i)
		if( i == 4):
			author = descendant.string
		if(i == 7):
			title = descendant.string
		i += 1

	title_author_list.append([title, author])


for item in title_author_list:
	print(item)
	print()


output = open("title_auth_spencer.pkl","w")

pickle.dump(title_author_list, output)

output.close()


