source "$XDG_CONFIG_HOME/zsh/aliases"
fpath=($ZDOTDIR/external $fpath)
export TERM=xterm-256color
setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

autoload -Uz prompt_purification_setup; prompt_purification_setup
autoload -Uz cursor_mode && cursor_mode

# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Autocomplete hidden files
_comp_option+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

# VIM like key binding
bindkey -v
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
autoload -U compinit; compinit

# Allow zsh to use neovim to edit commands by hitting v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Location in Arch source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Location in Ubuntu
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# allow to navigate to a parent directory with bd command
source ~/dotfiles/zsh/external/bd.zsh
source $DOTFILES/zsh/scripts.sh

if [ $(command -v "fzf") ]; then
    # Arch location
    #source /usr/share/fzf/completion.zsh
    #source /usr/share/fzf/key-bindings.zsh
    # Ubuntu location
    source /usr/share/doc/fzf/examples/completion.zsh
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi
