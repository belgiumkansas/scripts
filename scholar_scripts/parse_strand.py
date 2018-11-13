import webbrowser
import scholarly

file = open("STRANDS.txt", "r")
title_list = []
for line in file:
	title = line.split('"')[1::2]
	if title:
		if title not in title_list:
			print title
			title_list.append(title)



