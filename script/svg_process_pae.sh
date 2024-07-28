#!/bin/bash

# add a white background to an SVG file, i.e.,
# add a white-filled <rect> element before the first <defs> tag
sed -i '0,/<defs/s/<defs/<rect width="100%" height="100%" fill="#ffffff" rx="10"\/>\n<defs/' $1
