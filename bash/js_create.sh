#!/bin/bash
cd erb/js
for file in *.erb; do
  eval "erb ${file} > ${file%????}"
  eval "minify --no-comments ${file%????}"
done
mv *.min.js ../../js/
rm *.js
