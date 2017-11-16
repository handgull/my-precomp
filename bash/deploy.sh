#!/bin/bash
./bash/compiler.sh
  if [ $? == 0 ]; then
    echo -e "\e[1;92mSource compiled successfully!\e[0m"
  fi
for i
do
  mkdir -p ~/e-temp
  cp -r css ~/e-temp
  cp -r js ~/e-temp
  cp -r pages ~/e-temp
  cp index.php ~/e-temp
  cp 404.html ~/e-temp
  cp 500.html ~/e-temp
  cp README.md ~/e-temp
  cp .htaccess ~/e-temp
  cp composer.json ~/e-temp
  git add -A
  git commit -m"$i"
  git checkout master
  cp -r ~/e-temp/css .
  cp -r ~/e-temp/js .
  cp -r ~/e-temp/pages .
  cp ~/e-temp/index.php .
  cp ~/e-temp/404.html .
  cp ~/e-temp/500.html .
  cp ~/e-temp/README.md .
  cp  ~/e-temp/.htaccess .
  cp  ~/e-temp/composer.json .
  rm -rf ~/e-temp
  git add -A
  git commit -m"$i"
  if [ $? == 0 ]; then
    echo -e "\e[1;92mSource committed successfully!\e[0m"
  else
    echo -e "\e[1;91mSource not committed!\e[0m"
    exit 1
  fi
  git checkout dev
  exit 0
done
echo -e "\e[1;91mSource not committed!\e[0m"
exit 1
