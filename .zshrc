zstyle ':znap:*' repos-dir ~/.zsh-snap/plugins

# zsh-autocomplete configs
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:recent-dirs' backend zoxide
zstyle ':autocomplete:*' ignored-input '(\*\*|..)'

source $HOME/.zsh-snap/znap.zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.zsh-snap/plugins/ohmyzsh

znap eval starship 'starship init zsh --print-full-init'
znap prompt

znap eval brew '/opt/homebrew/bin/brew shellenv'
source $HOME/.exports
source $HOME/.aliases
source $HOME/.functions

source $HOME/.config/themes/zsh-syntax-highlighting/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

znap source ohmyzsh/ohmyzsh plugins/git
znap source ohmyzsh/ohmyzsh plugins/tmux
znap source ohmyzsh/ohmyzsh plugins/fzf
znap source ohmyzsh/ohmyzsh plugins/pipenv
znap source ohmyzsh/ohmyzsh plugins/nvm
znap source ohmyzsh/ohmyzsh plugins/sudo

source $ZSH/oh-my-zsh.sh

# znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'
znap eval zoxide 'zoxide init zsh'

znap fpath _rustup  'rustup  completions zsh'
znap fpath _cargo   'rustup  completions zsh cargo'

znap function _pipenv pipenv
compdef       _pipenv pipenv

fpath+=$HOME/.zfunc

# add brew completions path to fpath
if hash brew 2>/dev/null; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

gpgconf --launch gpg-agent

typeset -U PATH fpath
export PATH

