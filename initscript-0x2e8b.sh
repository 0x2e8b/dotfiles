#!/bin/bash
dir=/home/"$(whoami)"
read -p  "będziem robić init, gotowy? [y/N]" -n 1 -r
echo    
if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
	fi
cd $dir || exit 
if test -f "$dir"/dotfiles; then
    echo "katalog już istnieje"
else
    git clone https://github.com/dr6g1/dotfiles
fi
find "$dir"/dotfiles -maxdepth 1 -type f \( -name ".*" ! -name ".git" \) | while read file;do ln -s "$file" "$dir"/;done
