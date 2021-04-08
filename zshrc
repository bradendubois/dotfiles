#!/bin/zsh

# Declare location of dotfiles (this folder!)
export DOTFILES="$HOME/dotfiles"

# Directory of zsh-specific resources
export ZSH=$DOTFILES/zsh

# Source all custom configs
for config in $ZSH/configs/*; do
    source $config
done

# Source all functions
for function in $ZSH/functions/*; do
    source $function
done

# source all aliases
source $ZSH/aliases

# Add any extra paths to, uh, $PATH
source $ZSH/path

# Run the following command (once!) to create the following .sh file
# antibody bundle < $ZSH/zsh_plugins.txt > $ZSH/zsh_plugins.sh

source $ZSH/zsh_plugins.sh

