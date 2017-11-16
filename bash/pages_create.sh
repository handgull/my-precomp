#!/bin/bash
cd erb/pages/
for file in *.erb; do
  eval "erb ${file} > ${file%????}"
done
mv index.php ../..
mv 404.html ../..
mv 500.html ../..
mkdir -p ../../pages/it
mkdir -p ../../pages/en
for file in it*.php; do
  eval "mv ${file} ../../pages/it/${file//it_}"
done
for file in en*.php; do
  eval "mv ${file} ../../pages/en/${file//en_}"
done
