# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

fpath+=~/.zfunc

# Enable completions
autoload -Uz compinit && compinit

source $HOME/.aliases
source $HOME/.exports
source $HOME/.functions

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
ZSH_AUTOSUGGEST_USE_ASYNC=true

plugins=( 
    git
    rust
    tmux
    sudo
    zsh-autosuggestions
    fzf
)

# add brew completions path to fpath
if hash brew 2>/dev/null; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

source $ZSH/oh-my-zsh.sh

gpgconf --launch gpg-agent

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

typeset -U PATH fpath
export PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
