#!/bin/bash
cd erb/scss/
for file in *.erb; do
  eval "erb ${file} > ${file%????}"
done
for file in *.scss; do
  eval "sass ${file} --style compressed > ${file%????}css"
done
rm *.scss
mkdir -p ../../css
mv *.css ../../css/
rm -rf .sass-cache/
