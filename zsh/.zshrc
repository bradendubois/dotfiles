#####

ADD_TO_PATH=()

#####
# machine-specific zshrcs

[ -f "$ZDOTDIR/zshrcs/$(uname -s)-pre.zsh" ] && . "$ZDOTDIR/zshrcs/$(uname -s)-pre.zsh"
[ -f "$ZDOTDIR/zshrcs/$(uname -s)-$(uname -n)-pre.zsh" ] && . "$ZDOTDIR/zshrcs/$(uname -s)-$(uname -n)-pre.zsh"

#####
# path

for dir in $ADD_TO_PATH; do
    if [ -d $1 ] && [[ ":${PATH}:" != *":$1:"* ]]; then
        export PATH=${PATH}:$dir
    fi
done

#####
# misc

if type nvim > /dev/null; then
    export EDITOR=nvim
    export VISUAL=nvim
fi

setopt autocd

PROMPT='%n@%~ %# '

#####
# aliases

[ -f $ZDOTDIR/aliases ] && . $ZDOTDIR/aliases

#####
# history

setopt hist_ignore_all_dups inc_append_history
HISTFILE=$ZDOTDIR/histfile
HISTSIZE=2048
SAVEHIST=2048

####
# completions

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz +X compinit && compinit

zstyle ':completion:*' completer _complete _ignored _correct
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

#####
# antibody

if [[ ! -f $ZDOTDIR/zsh_plugins.sh && $(type antibody) && -f $ZDOTDIR/zsh_plugins.txt ]]; then
    antibody bundle < $ZDOTDIR/zsh_plugins.txt > $ZDOTDIR/zsh_plugins.sh
fi

[[ -f "$ZDOTDIR/zsh_plugins.sh" ]] && . "$ZDOTDIR/zsh_plugins.sh"

#####
# machine-specific zshrcs

[ -s "$ZDOTDIR/zshrcs/$(uname -s)-post.zsh" ] && . "$ZDOTDIR/zshrcs/$(uname -s)-post.zsh"
[ -s "$ZDOTDIR/zshrcs/$(uname -s)-$(uname -n)-post.zsh" ] && . "$ZDOTDIR/zshrcs/$(uname -s)-$(uname -n)-post.zsh"

