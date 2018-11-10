from bs4 import BeautifulSoup
import scholarly



file_html = open("STANLEY_html", "r")

data_html = file_html.read()

soup = BeautifulSoup(data_html, 'html.parser')

titles = soup.find_all("p", "pubtitle")



results_list = []
test = 0
for hit in titles:
	try:
		test += 1
		search_query = scholarly.search_pubs_query(hit.contents[0])
		result  = (next(search_query))
		result.citedby
		results_list.append((hit.contents[0], result.citedby))
	except:
		print "exception \n"
	else:
		print test


results_list.sort(key=lambda tup: tup[1], reverse=True)

with open('stanley+parsed.txt', 'w') as f:
    for item in results_list:
    	f.write("%s: %s\n" % (item[1], item[0]))