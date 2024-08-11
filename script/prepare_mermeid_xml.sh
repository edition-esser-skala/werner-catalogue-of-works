#!/bin/bash

# remove the revision description and rename files

for s in `ls WerW*`; do
  t=`echo $s | sed "s/[^_]*_//"`
  echo "Processing $s to $t"
  xmlstarlet edit --inplace --delete "//_:revisionDesc" $s
  mv $s $t
done
