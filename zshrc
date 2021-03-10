#!/bin/zsh

# Declare location of dotfiles (this folder!)
export DOTFILES="$HOME/dotfiles"

# Directory of zsh-specific resources
export ZSH=$DOTFILES/zsh

CONFIGS=$ZSH/configs
FUNCTIONS=$ZSH/functions

ALIASES=$ZSH/aliases
PATHS=$ZSH/path

# Source all custom configs
for config in $CONFIGS/*; do
    source $config
done

# Source all functions
for function in $FUNCTIONS/*; do
    source $function
done

# source all aliases
source $ALIASES

# Add any extra paths to, uh, $PATH
source $PATHS

# Run the following command (once!) to create the following .sh file
# antibody bundle < $ZSH/zsh_plugins.txt > $ZSH/zsh_plugins.sh

source $ZSH/zsh_plugins.sh

