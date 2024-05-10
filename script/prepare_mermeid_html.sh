#!/bin/bash

# adjust a few paths in the HTML file provided as first argument

# ../style/mei_to_html.css
# ->
# resources/mei_to_html.css
sed -i 's#\.\./style#resources#g' $1

# ../resources/js/toggle_openness.js
# ->
# resources/toggle_openness.js
sed -i 's#\.\./resources/js#resources#g' $1

# ../resources/images/plus.png
# ->
# resources/plus.svg
sed -i 's#\.\./resources/images/plus\.png#resources/plus\.svg#g' $1

# ../resources/images/html_link.png
# ->
# resources/html_link.svg
sed -i 's#\.\./resources/images/html_link\.png#resources/html_link\.svg#g' $1

# https://www.verovio.org/javascript/latest/verovio-toolkit.js
# ->
# resources/verovio-toolkit.js
sed -i 's#https://www\.verovio\.org/javascript/latest#resources#g' $1
