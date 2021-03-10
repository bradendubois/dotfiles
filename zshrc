#!/bin/zsh

###############################################################
#                        main commands                        #
###############################################################

                ##############################
                #         variables          #
                ##############################

export DOTFILES="$HOME/dotfiles"  # Declare location of dotfiles (this folder!)
export ZSH_DIR=$DOTFILES/zsh      # Directory of zsh-specific resources

CUSTOM_CONFIGS=$ZSH_DIR/configs      # Directory of custom config files
CUSTOM_FUNCTIONS=$ZSH_DIR/functions  # Directory of custom functions
CUSTOM_ALIASES=$ZSH_DIR/aliases      # All aliases
CUSTOM_PATH=$ZSH_DIR/path            # All path additions


                ##############################
                #         sourcing           #
                ##############################

# Source all custom configs
for config in $CUSTOM_CONFIGS/*; do
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

# Add any extra paths to, uh, $PATH
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

source $ZSH_DIR/antigen.zsh

                ##############################
                #          bundles           #
                ##############################

# Save aliases to avoid oh-my-zsh overrides
save_aliases=$(alias -L)

antigen use oh-my-zsh

# These are all part of oh-my-zsh
antigen bundle git
antigen bundle wd

antigen bundle Valiev/almostontop
antigen bundle Cloudstek/zsh-plugin-appup
antigen bundle arzzen/calc.plugin.zsh
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle zsh-users/zsh-completions
antigen bundle igoradamenko/npm.plugin.zsh
antigen bundle athityakumar/colorls
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

                ##############################
                #                            #
                #   ^                        #
                #  / \    geometry is nice   #
                # /___\                      #
                #                            #
                ##############################

# Load the geometry theme
antigen theme geometry-zsh/geometry

                ##############################
                #         applying           #
                ##############################

antigen apply

# Unset all the aliases added by oh-my-zsh
eval $save_aliases; unset save_aliases

