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
  title=$( echo "${final_slug}" | sed 's/-/ /g' )
  echo "${title}"
   exit
done



