#  formattedHTML=${formattedHTML::-913}
#  finalHTML=$( echo "${formattedHTML}" | sed -E "s/(<figure).*(<script>\\n).*(<\/script>).*(<\/figure>)/ /")

  # removes all of the improperly placed escapes paired with quotes.
#  matcher='*'
#  replacement='\"'
#
#  local=0
#  countInstances=$(( countInstances + 1 ))
#  echo "========[ CHECK INSTANCES | ${countInstances}]============="
#
#  echo "${phaseOne}" | sed -e 's/)/(/1'
#
#  exit
#  if [ $local -lt $countInstances ] && [ $(( local % 2 )) -eq 0 ]; then
#    echo "its even"
#    else
#      echo "its odd"
#  fi


  # removes all of the improperly placed escapes paired with quotes.
#  matcher=')'
#  replacement="("
#
#  echo "REPLACEMENT -> ${body_clean//$matcher/$replacement}"


# on the first pass. | wc -l
  # | grep -o '\\"'

#  echo "$body_clean"

# re="http://([^/]+)/"
# if [[ $name =~ $re ]]; then echo ${BASH_REMATCH[1]}; fi
#  reg="(<p>).*?(<\/p>)"
#  if [[ $body_clean =~ $reg ]]; then echo "${BASH_REMATCH[1]}"; fi


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