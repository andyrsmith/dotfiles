source "$XDG_CONFIG_HOME/zsh/aliases"
fpath=($ZDOTDIR/external $fpath)
export TERM=xterm-256color
setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

autoload -Uz prompt_purification_setup; prompt_purification_setup
autoload -Uz cursor_mode && cursor_mode

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Autocomplete hidden files
_comp_option+=(globdots)
source ~/dotfiles/zsh/.config/zsh/external/completion.zsh

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

# Location in Arch 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Location in Ubuntu
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# allow to navigate to a parent directory with bd command
source ~/dotfiles/zsh/.config/zsh/external/bd.zsh
source $DOTFILES/zsh/.config/zsh/scripts.sh

if [ $(command -v "fzf") ]; then
    # Arch location
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
    # Ubuntu location
    #source /usr/share/doc/fzf/examples/completion.zsh
    #source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# Set Ctrl-g to clear screen
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# SSH Agent 
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi 
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null 
fi

# Cheatsheats
function cheat() {
    #if [ "$1" != ""]
    #then
        bat ~/Documents/vault/04-Resources/Cheatsheats/$1.md
    #fi
}

# Created by `pipx` on 2025-07-19 17:48:48
export PATH="$PATH:/home/andy/.local/bin"
