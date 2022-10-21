{
  # zcompile the completion cache for siginificant speedup
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
  # zcompile .zprofile
  zprofile="${ZDOTDIR:-$HOME}/.zprofile"
  if [[ -s "$zprofile" && (! -s "${zprofile}.zwc" || "$zprofile" -nt "${zprofile}.zwc") ]]; then
    zcompile "$zprofile"
  fi
  # zcompile .zshrc
  zshrc="${ZDOTDIR:-$HOME}/.zshrc"
  if [[ -s "$zshrc" && (! -s "${zshrc}.zwc" || "$zshrc" -nt "${zshrc}.zwc") ]]; then
      zcompile "$zshrc"
  fi
} &!

