#!/bin/bash
CSVS="county.csv housing.csv cost_of_meal.csv school_meal.csv"
mkdir tmp
cp $CSVS tmp
dos2unix tmp/* 2&> /dev/null
xsv join FIPS tmp/county.csv FIPS tmp/housing.csv --output tmp/accum1.csv
xsv join FIPS tmp/accum1.csv FIPS tmp/cost_of_meal.csv --output tmp/accum2.csv
xsv join FIPS tmp/accum2.csv FIPS tmp/school_meal.csv --output county_full.csv
rm -rf tmp
