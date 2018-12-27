#! /usr/bin/env bash

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

echo ""
echo "Done."
echo ""
echo "Now to install the dependencies, run:"
echo "yarn add typescript tslint tslint-config-prettier --dev"
echo ""
echo "Bye."
