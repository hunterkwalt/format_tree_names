#!/bin/bash

#2/17/2023

##This script will take a fasta and rename the accessions to include an organism name. 

###It takes a fasta of your orthogroup of interest as the first argument, and the directory in which your orthofinder input fastas are as the second input.

#example call ./change_names.sh OG_of_interest.fasta /directory/to/orthofinder/input/fastas

#get list of names: it takes a fasta as the first argument

names=$(cat $1 | grep ">")

#it searches through my orthofinder input folder to find what file the accession is in, and it adds the organism name to the beginning of the accession
for line in $names

do
	#gets the file that the accession number is in
	d=$(grep $line ${2}/*.faa | cut -f 1 -d ":")	#second argument is directory with orthofinder input .faa's
	#takes just the organism name from the file
	n=$(basename $d .faa)
	#switches the name in the fasta to the organism name + the accession number
	sed -i "s/${line}/${line}_${n}/g" $1
	
done
