#!/bin/bash

# remove the revision description

xmlstarlet edit --inplace --delete "//_:revisionDesc" $1

