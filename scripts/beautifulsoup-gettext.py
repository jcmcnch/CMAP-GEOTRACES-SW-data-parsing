#!/usr/bin/env python
from bs4 import BeautifulSoup
#from bs4 import UnicodeDammit

#inHTML = open("index.html", "rb")
#inHTML = inHTML.read()
#new_doc = UnicodeDammit.detwingle(inHTML)
#soup = BeautifulSoup(inHTML, 'html5lib')

#soup = BeautifulSoup("<html>a web page</html>", 'html.parser')

with open("index.html", "rb") as fp:
    soup = BeautifulSoup(fp, 'html.parser')

#foo = soup.findall("a")
#print(foo)

print(soup.get_text())
