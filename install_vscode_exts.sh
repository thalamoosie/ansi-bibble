#!/bin/bash

extensions_file="vscode-extensions.txt"

declare -a extensions=()

# Read extensions list file into array
while IFS= read -r ext || [[ -n "$ext" ]]; do
    extensions+=("$ext")
done < "$extensions_file"

# Install all extensions for VSCode
for extension in "${extensions[@]}"; do
    code --install-extension "$extension"
done