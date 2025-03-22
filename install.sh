#!/bin/bash

dotfilesPath=pwd;

function takeBackup()
{
    echo "Checking if file exists: $HOME/$1";
    if [ -f "$HOME/$1" ]; then
        echo "Taking a backup of $1 from $HOME";
        mv "$HOME/$1" "$HOME/$1.bk";
    fi
}

function setUpSymlink()
{
    FILE=".$1rc";
    takeBackup $FILE;
    echo "Creating Symlink: $FILE";
    ln -s "$(pwd)/$1/$FILE" "$HOME/$FILE";
    echo "Setup Complete for $FILE";
    echo "---------------------";
}

setups=(
    "vim"
    "zsh"
);

for setup in "${setups[@]}"
do
    setUpSymlink $setup;
done
