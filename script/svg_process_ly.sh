#!/bin/bash

# scale the size of an SVG file by a given factor, i.e.,
# modify the values of the width and height attribute of the <svg> element

# scaling factor
sf=2.1

# extract value of the width attribute of the <svg> element and double it
w=`grep -oP ' width="\d+"' $1 | grep -oP "\d+"`
w=`echo "$w * $sf" | bc`

# same for the value of the height attribute
h=`grep -oP ' height="\d+"' $1 | grep -oP "\d+"`
h=`echo "$h * $sf" | bc`

# replace values in the svg file
sed -i -r "s/width=\"[0-9]+\" height=\"[0-9]+\"/width=\"$w\" height=\"$h\"/" $1

# add a white background to an SVG file, i.e.,
# add a white-filled <rect> element before the first <defs> tag
sed -i '0,/<defs/s/<defs/<rect width="100%" height="100%" fill="#ffffff" rx="5"\/>\n<defs/' $1
