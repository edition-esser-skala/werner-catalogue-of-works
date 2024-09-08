#!/bin/bash

# remove the revision description and rename files

if [ $# -eq 0 ]; then
  echo "Error: Specify catalogue of works abbreviation as first argument"
  exit 1
fi


for s in `ls $1*`; do
  t=`echo $s | sed "s/[^_]*_//"`
  echo "Processing $s to $t"
  xmlstarlet edit --inplace --delete "//_:revisionDesc" $s
  mv $s $t
done
