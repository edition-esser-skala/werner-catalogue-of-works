#!/bin/bash

mkdir -p $QUARTO_PROJECT_OUTPUT_DIR/metadata/mei
cp data/works_mei/* $QUARTO_PROJECT_OUTPUT_DIR/metadata/mei
cp -r data_generated/erc $QUARTO_PROJECT_OUTPUT_DIR/metadata
cp .htaccess $QUARTO_PROJECT_OUTPUT_DIR
cp images/ees_link_dark.svg $QUARTO_PROJECT_OUTPUT_DIR/images
