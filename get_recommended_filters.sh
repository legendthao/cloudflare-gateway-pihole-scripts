#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
  https://abpvn.com/vip/thao.txt?ublock
  https://abpvn.com/filter/abpvn-aO11fb.txt?ublock
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/multi.txt
  https://filters.adtidy.org/extension/ublock/filters/2.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/extensions/gambling/filter.txt
  https://badmojr.github.io/1Hosts/Lite/adblock.txt
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
