#!/bin/zsh

###############################################################
#                        main commands                        #
###############################################################


                ##############################
                #         variables          #
                ##############################

export DOTFILES="$HOME/dotfiles"  # Declare location of dotfiles (this folder!)
export ZSH_DIR=$DOTFILES/zsh      # Should be this file!

CUSTOM_CONFIGS=$ZSH_DIR/configs      # Directory of custom config files
CUSTOM_FUNCTIONS=$ZSH_DIR/functions  # Directory of custom functions
CUSTOM_ALIASES=$ZSH_DIR/aliases      # All aliases
CUSTOM_PATH=$ZSH_DIR/path            # All path additions


                ##############################
                #         sourcing           #
                ##############################

# Source all custom configs
for config in $CUSTOM_FUNCTIONS/*; do
  if [ -f $config ]; then
    source $config
  fi
done

# Source all functions
for function in $CUSTOM_FUNCTIONS/*; do
  if [ -f $function ]; then
    source $function
  fi
done

# Add to path
if [ -f $CUSTOM_PATH ]; then
  source $CUSTOM_PATH
fi

# Source all aliases
if [ -f $CUSTOM_ALIASES ]; then
  source $CUSTOM_ALIASES
fi

###############################################################
#                           antigen                           #
###############################################################

# Save aliases to avoid oh-my-zsh
save_aliases=$(alias -L)

source $ZSH_DIR/antigen.zsh

antigen use oh-my-zsh

                ##############################
                #          bundles           #
                ##############################

antigen bundle git
antigen bundle wd
antigen bundle thefuck

antigen bundle Valiev/almostontop
antigen bundle Cloudstek/zsh-plugin-appup
antigen bundle arzzen/calc.plugin.zsh
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle zsh-users/zsh-completions

                ##############################
                #                            #
                #   ^                        #
                #  / \    geometry is nice   #
                # /___\                      #
                #                            #
                ##############################

# Load the theme.
antigen theme geometry-zsh/geometry

                ##############################
                #         sourcing           #
                ##############################

# Tell Antigen that you're done.
antigen apply



# Unset all the aliases added by oh-my-zsh
eval $save_aliases; unset save_aliases