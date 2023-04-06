#!/bin/bash

# looking up the releases list here.
lookup_dir=../docs/releases

# loop the entries and get each title.
for entry in "$lookup_dir"/*
do
  echo ""
  echo "============[ITER]================"
  # removes the prepended info from the file path.
  remove_prepend=${entry:17}
  echo "file path removed: $remove_prepend"

  # remove the .mdx trailing path
  reversed_prepend=$(echo "${remove_prepend}" | rev)
  slug=${reversed_prepend:4}
  echo "-----New Final Slug Value-----"
  final_slug=$(echo "${slug}" | rev)
  echo "${final_slug}"

  # now we need to convert the slug to a title.
  echo ""
  # shellcheck disable=SC2001
  rough_title=$( echo "${final_slug}" | sed 's/-/ /g' )
  echo "the rough draft of the title: ${rough_title}"

  tracker=0
  # define delimiter
  IFS=' '
  # read words/characters in
  read -r -a strarr <<< "$rough_title"

  title_store=""

  for val in "${strarr[@]}";
  do
    echo "Current Val: ${val}"
    next=${strarr[($tracker + 1)]}
    echo "Next: $next"

    # if the next contains a number in it.
    if [[ "$next" =~ [0-9] ]]
    then

      # we also need to make sure in this case that we are
      # not starting on a letter and append "-" to connect it to the $next var.
      if [[ "$val" =~ [a-z] ]];
      then
        echo "The current value is a word"
        lead=$( echo "${val:0:1}" | tr 'a-z' 'A-Z')
        full=${lead}${val:1}
        title_store="${title_store}${full} "
      else
        echo "The current value is a number"
        title_store="${title_store}${val}-"
      fi

    else
        lead=$( echo "${val:0:1}" | tr 'a-z' 'A-Z')
        full=${lead}${val:1}

      if [[ -z "${next}" ]]
      then
        echo "empty"
      else
        echo "not empty"
      fi
      # shellcheck disable=SC2116
      title_store=$(echo "${title_store}""${full}"" ")
    fi
#    echo " "
    tracker=$(( tracker + 1 ))
  done

  # now we have the slug and the title - we need to store them as a pair:
#  echo ""
#  echo "New Title: ${title_store}"
  title_rev=$(echo "${title_store}" | rev)
  final_title=$(echo "${title_rev:1}" | rev )

  echo "Slug: ${final_slug}"
  echo ""
  pair="[\"${final_title}\", \"/updates/${final_slug}\"]"
  echo "$pair" >> ../docs.json

  # now we take the new entry and add it to the json file on docs.json

#  echo  "${returned}" >> ../docs/releases/"${slug_clean}".mdx
done



# [[ "$date" =~ ^[0-9]{8}$ ]] && echo "yes"

# final_slug=$(echo "${slug}" | rev)