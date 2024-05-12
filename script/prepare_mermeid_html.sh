#!/bin/bash

# (1) adjust a few paths in the HTML file provided as first argument

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


# (2) remove the colophon
xmlstarlet edit --inplace --delete "//_:div[@class='colophon']" $1

# (3) add lightbox support
work_id=$(basename $1 .html)
lightbox_scripts='<script src="/site_libs/quarto-contrib/glightbox/glightbox.min.js"></script>\n    <link href="/site_libs/quarto-contrib/glightbox/glightbox.min.css" rel="stylesheet">\n    <link href="/site_libs/quarto-contrib/glightbox/lightbox.css" rel="stylesheet">'
lightbox_options='<script>var lightboxQuarto = GLightbox({"loop":false,"closeEffect":"zoom","descPosition":"bottom","openEffect":"zoom","selector":".lightbox"});</script>'
lightbox_link="<a class=\"lightbox\" href=\"/incipits/$work_id/\1.png\"><img src=\"/incipits/$work_id/\1_low.png\"/></a>"

sed -i "s#</head>#  $lightbox_scripts\n  </head>#g" $1
sed -i "s#</body>#  $lightbox_options\n  </body>#g" $1
sed -i "s#<img.*src=\"\([a-zA-Z0-9_]\+\)\.png\"/>#$lightbox_link#" $1
