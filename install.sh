#!/usr/bin/env bash

URI="https://raw.githubusercontent.com/lffg/ts/master"

FILES=(
  "tsconfig.json"
  "tslint.json"
)

for file in "${FILES[@]}"; do
  if [ -f "./$file" ]; then
    echo "Removing the \`$file\` file..."
    rm "./$file"
  fi

  echo "Downloading the \`$file\` file..."
  curl -s -X GET "$URI/$file" -o $file
done

echo "\nDone."
echo "\nDo you want to install the dependencies (will use Yarn)? (y/N)"
read install

if [ "$response" = "y" -o "$response" = "Y" ]; then
  if [ ! -f "package.json" ]; then
    yarn init -y --silent
  fi

  yarn add typescript tslint tslint-config-prettier --silent --dev
  echo "\nDone."
else
  echo "Ok. Bye."
fi
