#!/bin/bash

# remove the revision description

xmlstarlet edit --inplace --delete "//_:revisionDesc" WerW_$1.xml
mv WerW_$1.xml $1.xml
