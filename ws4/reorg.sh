#!/bin/bash

# setting variable to get the current date and time for file naming
date_time=$(date "+%F-%T")

#input file (easier name)
file="taxi_dataset.csv"

# loop over vendorid values and process the dataset
for vendor in 1.0 2.0 4.0; do
  #create a new CSV file for each vendor
  output_file="${date_time}-${vendor}.csv"

  # use sed to filter the data for each vendor and save it to the output file
  sed -n "/^${vendor},/p" "$file" > "$output_file"

  # add  file to .gitignore
  echo "$output_file" >> .gitignore
done

# Create ws4.txt with wc command results for each vendor's file
for vendor in 1.0 2.0 4.0; do
  output_file="${date_time}-${vendor}.csv"
  wc_result=$(wc "$output_file")
  echo "$wc_result" >> ws4.txt
done

# Append the content of .gitignore to ws4.txt
echo "Content of .gitignore:" >> ws4.txt
cat .gitignore >> ws4.txt

