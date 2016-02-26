#!/bin/bash

# $DATA_DIR = "~/github/W205/Ex1/data"
ORIG_DIR="orig/" 

mv "Hospital General Information.csv" hospitals.csv 
mv "Timely and Effective Care - Hospital.csv" effective_care.csv 
mv "Readmissions and Deaths - Hospital.csv" readmissions.csv
mv "Measure Dates.csv" measures.csv
mv "hvbp_hcahps_05_28_2015.csv" surveys_responses.csv

rm "Hospital.pdf"

# rename only works on first match, so do 10 times
for i in `seq 1 10`; do
	# remove dashes from filenames
	rename "-" "_" *.csv;

	# remove spaces from filenames
	rename " " "" *.csv
done

# remove headers from files and put them in .head files
for i in `ls *.csv`; do
	echo "Removing header from $i"
	head -1 $i > $i.head;
	tail -n +2 $i > $i.tail;
done

# back up the original csv files and rename .tail to .csv
mkdir $ORIG_DIR
mv *.csv $ORIG_DIR
rename .csv.tail .csv *.tail

# create directory in HDFS
hdfs dfs -mkdir /user/w205/hospital_compare

FILES="
hospitals.csv 
effective_care.csv 
readmissions.csv
measures.csv
surveys_responses.csv
"

# load files into HDFS
for f in $FILES; do
	echo "Putting $f"
	hdfs dfs -put $f /user/w205/hospital_compare
done

