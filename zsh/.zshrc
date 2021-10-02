#!/bin/zsh


# All directories / files to source
components=(
    $ZDOTDIR/configs
    $ZDOTDIR/functions
    $ZDOTDIR/aliases
    $ZDOTDIR/exports
    $ZDOTDIR/path
)


for c in $components; do

    [ -d $c ] && {
        for f in $c/*; do
             source $f
        done
    }

    [ -f $c ] && {
        source $c

        # any file can have a .local-suffixed duplicate that won't be tracked
        #   by git; useful for sensitive / private data
        [ -f $c.local ] && source $c.local
    }

done


# case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz +X compinit && compinit


# Run the following command (once!) to create the following .sh file
# antibody bundle < $ZSH/zsh_plugins.txt > $ZSH/zsh_plugins.sh
source $ZDOTDIR/zsh_plugins.sh

