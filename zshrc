#!/bin/zsh

# Declare location of dotfiles (this folder!)
export DOTFILES="$HOME/dotfiles"

# Directory of zsh-specific resources
ZSH=$DOTFILES/zsh

# All directories / files to source
components=(
    $ZSH/configs
    $ZSH/functions
    $ZSH/aliases
    $ZSH/exports
    $ZSH/path
)

autoload -U +X compinit && compinit

for c in $components; do

    [ -d $c ] && {
        for f in $c/*; do
             source $f
        done
    }

    [ -f $c ] && {
        source $c file

        # any file can have a .local-suffixed duplicate that won't be tracked
        #   by git; useful for sensitive / private data
        [ -f $c.local ] && source $c.local
    }

done

autoload -U +X compinit && compinit

compctl -M 'm:{a-zA-Z}={A-Za-z} r:|[_.-]=* r:|=*'

# Run the following command (once!) to create the following .sh file
# antibody bundle < $ZSH/zsh_plugins.txt > $ZSH/zsh_plugins.sh
source $ZSH/zsh_plugins.sh

