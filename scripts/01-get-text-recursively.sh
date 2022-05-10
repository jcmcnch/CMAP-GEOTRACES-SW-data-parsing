#!/bin/bash -i
conda activate beautifulsoup

#specify output file
outfile=results/01-scraped-text.tsv
rm $outfile 2> /dev/null

#remove any stray webpages
rm index.html 2> /dev/null

#recurse through results
for item in `cut -f2 results/00-links-BODC.tsv`; do

	BODClink=`echo $item | cut -f2 -d" "`
	wget $BODClink 2> /dev/null

	#use beautifulsoup to parse text from HTML then grep / tr to slice & clean up
	scrapedText=`./scripts/beautifulsoup-gettext.py | grep -z -o -P '(?<=Acquisition description)(?s).*(?=References Cited)' | tr '\n' ' ' | tr -d '\0'`

	#print to tsv
	printf "$item\t%s\n" "$scrapedText" >> $outfile

	#remove any stray webpages
	rm index.html 2> /dev/null
done
