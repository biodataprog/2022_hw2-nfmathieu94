#!/bin/bash -l

# step to write
# download the CSV file
# curl -o calfire.csv ...

curl -o calfires.csv https://gis.data.cnra.ca.gov/datasets/CALFIRE-Forestry::recent-large-fire-perimeters-5000-acres.com

# print out the range of years found -- you may need to go in and edit the file
# cut -d, ....
MINYEAR=1900
MAXYEAR=1901

echo -n | cut -d , -f2 calfires.csv | sort -n


# write code to set these variables with the smallest and largest years

MINYEAR=$(cut -d , -f2 calfires.csv | sort -n | tail -n +2 | head -n 1)
MAXYEAR=$(cut -d , -f2 calfires.csv | sort -n | tail -n 1)
echo "This report has the years: $MINYEAR-$MAXYEAR" # if you have problems the CSV file already part of this repository so you can use 'calfires_2021.csv'

# print out the total number of fires (remember to remove the header line)
TOTALFILECOUNT=0

echo -n | cut -d , -f2 calfires.csv | sort -n | tail -n +2 | wc -l

# put your code here to update this variable

TOTALFILECOUNT=$(cut -d , -f2 calfires.csv | sort -n | tail -n +2 | wc -l)

echo "Total number of files: $TOTALFILECOUNT"

# print out the number of fire in each year

FIRES_EACH_YEAR=$(cut -d , -f2 calfires.csv | sort -n | tail -n +2 | uniq -c)

echo "Number of fires in each year follows: $FIRES_EACH_YEAR "


# print out the name of the largest file use the GIS_ACRES and report the number of acres
LARGEST=$(cut -d , -f6,13 calfires.csv | sort -t',' -k2,2n | cut -d , -f1 | tail -n 1)
LARGESTACRES=$(cut -d , -f13 calfires.csv | sort -n | tail -n 1)
echo "Largest fire was $LARGEST and burned $LARGESTACRES"

# print out the years - change the code in $(echo 1990) to print out the years (hint - how did you get MINYEAR and MAXYEAR?

cut -d , -f2,13 calfires.csv | sort -n >> year_and_acres.csv

for YEAR in $(year_and_acres.csv)
do
#      TOTAL=$(grep ... | awk ...)
      echo "In Year $YEAR, Total was $TOTAL"
done
