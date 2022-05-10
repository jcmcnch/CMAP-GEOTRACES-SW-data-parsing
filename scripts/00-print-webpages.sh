#!/bin/bash -i
mkdir -p results

#Using HTML files from GEOTRACES IDP, pull out web links we need to crawl to get methods descriptions for CMAP so this whole process can be semi-automated
for item in ../infos/*html; do 

	#Grep out links to methods
	links=`grep "Link to detailed originator and methods information" "$item" | cut -f2 -d"\"" | tr '\n' '\t'`
	printf "$item\t$links\n" 

done > results/00-links-BODC.tsv
