#!/bin/bash

# first reset directory usage to prevent errors.
cd ../reference

echo ""
echo "==============[BEGIN]================="
# get the length of the json array for loop.
total=$(jq '. | length' csv.json)
counter=0

# article count
echo ""
echo "==============[ARTICLES ABOUT TO BE PARSED]=================="
echo "Number of articles: $total"

# loop json object and create files with low grade titles.
while [ $counter -lt "$total" ];
do
  jq ".[$counter]" csv.json > ../data/release_$counter.json
  counter=$(( counter + 1))
done

# keep the loop counter here - will reassign for clarity.
unformatted=$total
formatted=0

echo ""
echo "==============[CHECK JSON ITEMS IN ARRAY]=================="
echo "Total Counted Json Objects: $total"
echo ""
echo "==============[CHECK SAVED FILES #]=================="
echo "Total Counted Saved Article Files: $counter"
echo ""
echo "====================== [TOTAL VS COUNTER CHECK BEFORE ITERATION] ========================="
echo "$total | $counter"
echo ""
echo "====================== [FILES TO FORMAT] ========================="
echo "Total Files to Format: $unformatted"


while [ $formatted -lt "$unformatted" ];
do
  ## data that we are going to get from each json
  slug=$(jq ".Slug" ../data/release_$formatted.json)
  title=$(jq ".Name" ../data/release_$formatted.json)
  tags=$(jq ".Tags" ../data/release_$formatted.json)
  image=$(jq ".HeaderImage" ../data/release_$formatted.json)
  published=$(jq ".Published" ../data/release_$formatted.json)

  body=$(jq ".MainBody" ../data/release_$formatted.json)

  # clean slug for file to remove quotes.
  slug_temp="${slug:1}"
  slug_clean="${slug_temp%?}"

  # clean name for file to remove quotes.
  title_temp="${title:1}"
  title_clean="${title_temp%?}"

  # clean tags for file to remove quotes.
  image_temp="${image:1}"
  image_clean="${image_temp%?}"

  # clean tags for file to remove quotes.
  pub_temp="${published:1}"
  pub_clean="${pub_temp%?}"

  # clean tags for file to remove quotes.
  body_temp="${body:1}"
  body_clean="${body_temp%?}"

  ## print them out to check if cleaned
  echo ""
  echo "====================== [CHECK FILE DATA] ========================="
  echo "Slug: $slug_clean"
  echo "Image: $image_clean"
  echo "Title: $title_clean"
  echo "Tags: $tags"
  echo "Published: $pub_clean"
  echo ""

  # create the properly named file - using the slug - here.
  touch ../data/"${slug_clean}".mdx

  # add the image to the file
  image_clean="![](${image_clean})"
  # shellcheck disable=SC2129
  echo "${image_clean}" >> ../data/"${slug_clean}".mdx

  # now add the tags below that:
  echo "${tags}" >> ../data/"${slug_clean}".mdx

  # add heading for markdown -> then the title to the file:
  title_clean="# ${title_clean:0}"
  echo "${title_clean}" >> ../data/"${slug_clean}".mdx

  # then the publishing date of the article:
  pub_clean="> ${pub_clean:0}"
  echo "${pub_clean}" >> ../data/"${slug_clean}".mdx

  echo "<body>" >> ../data/"${slug_clean}".mdx

  # and the body here:
  echo "${body_clean}" >> ../data/"${slug_clean}".mdx

  echo "</body>" >> ../data/"${slug_clean}".mdx

  # then destroy the old copy now that we are done with it:
  rm ../data/release_$formatted.json

  formatted=$(( formatted + 1 ))
  echo ""
  echo "======================== BODY [NOT PARSED] ============================="
#  echo "$body_clean"

# re="http://([^/]+)/"
# if [[ $name =~ $re ]]; then echo ${BASH_REMATCH[1]}; fi
#  reg="(<p>).*?(<\/p>)"
#  if [[ $body_clean =~ $reg ]]; then echo "${BASH_REMATCH[1]}"; fi

  echo ""


  exit

  echo ""
  echo "====================== [FILE COMPLETED] ========================="
  echo "DONE | $completed"
done



#  clean_string() {
#    s_temp=$1:1
#    s_final="${s_temp%?}"
#  }

# COME BACK IF SPLIT ALT FAILS
#  IFS='$"';
#  read -ra arr <<< "$slug"
#
#  for val in "${arr[@]}";
#  do
#    echo $name
#  done
#jq '.[0]' csv.json > ../data/.json

####### VERSION 1 #################
#TEMP=()
#TEMP=$(cat "$file")
#
#echo "${TEMP}"


## while:::

#
## set the "words" variable equal to a counter per line
#words=$(echo -n "$line" | wc -w)
#
## if it exceeds 90 lines or more - it is a release note.
#if [[ $words -ge 90 ]]; then
#  cd ~/Documents/GitHub/pheonix/data/
#  ls
#  touch "file_$i.txt"
#
#  NAME[$k]="file_$i.txt"
#  k=$k+1
#  echo "$line" > file_$i.txt
#
#  # comment in this exit to test a single iteration
#  #  exit
#fi
#
#i=$((i+1))
#done < $file
#
#echo "All Files have been added to the data folder."
#echo "====================================="
#echo "Beginning Format."
#echo "List of Files to Format & Parse:"
#
## loop and list all of the file names in the array, and format the file.
#for g in "${NAME[@]}"
#do
#  if [ $g = "_" ]; then
#    echo "Skipping placeholder."
#  else
#    # file name we are working on.
#    echo "CURRENT FILE | $g"
#    echo " "
#
#    # first get the contents of the file and save to a variable.
#    contents=$(<"$g")
#    echo "CONTENTS: $contents"

#    # define the multi character delimiter and combine it with the string
#    delimiter="<p>"
#    combined=$contents$delimiter
#    temp=()
#
#    # delimiter logic here
#    while [[ $combined ]]; do
#      temp+=( "${comnined%%"$delimiter"*}" )
#      combined=${combined#*"$delimiter"}
#    done
#
#    # print everything after splitting
#    for value in "${temp[@]}"
#    do
#      echo -n "$value"
#    done
#  fi
#done


