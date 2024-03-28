#!/usr/bin/env zsh
# -*-zsh-*- vim:ft=zsh

fpath+=~/.zfunc

# core exports
export DOTFILES="$HOME/.dotfiles"
export CONFIG="$HOME/.config"
export ZNAP="$CONFIG/znap"
export ZSH="$ZNAP/ohmyzsh/ohmyzsh"

# push prompt to the bottom of screen
printf '\n%.0s' {1..$(($(tput lines)))}

# znap
[[ -r $ZNAP/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZNAP/znap

source $ZNAP/znap/znap.zsh

# evals
znap eval brew '/opt/homebrew/bin/brew shellenv'
znap eval zoxide 'zoxide init zsh'

# exports, aliases and functions
source $HOME/.exports
source $HOME/.do-not-commit-these-exports
source $HOME/.aliases
source $HOME/.functions

# opts
setopt NO_HUP
setopt NO_BG_NICE
setopt NO_LIST_BEEP

setopt LOCAL_TRAPS
setopt LOCAL_OPTIONS

setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

setopt CORRECT
setopt COMPLETE_ALIASES

# plugin config
zstyle ':completion:*' word true
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator ''
zstyle ':completion:*' extra-verbose true
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' option-stacking true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion::complete:*' use-cache true
zstyle ':completion::complete:*' call-command true
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:git-checkout:*' sort false

zstyle ':omz:lib:directories' aliases no

zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' single-group prefix color header

zstyle ':fzf-tab:sources' config-directory "$CONFIG/fzf-tab-source"

# plugins
znap source ohmyzsh/ohmyzsh oh-my-zsh.sh
znap source Aloxaf/fzf-tab
znap source Freed-Wu/fzf-tab-source
znap source zsh-users/zsh-autosuggestions
znap source catppuccin/zsh-syntax-highlighting themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh
znap source zsh-users/zsh-syntax-highlighting 

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
eval "$(starship init zsh --print-full-init)"

# path
typeset -U PATH fpath
export PATH

# neofetch
neofetch

