# This file is sourced by .zshrc. This script configures zsh color support.

autoload -U colors
colors

# Set terminal type.
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Bring up ${LS_COLORS}.
if [ -x /usr/bin/dircolors ] ; then
  if [ -r "${HOME}/.dir_colors" ] ; then
    eval $(dircolors -b "${HOME}/.dir_colors")
  elif [ -r /etc/DIRCOLORS ] ; then
    eval $(dircolors -b /etc/DIRCOLORS)
  else
    eval $(dircolors)
  fi
fi

if [ "${LS_COLORS}" ] ; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  unsetopt list_types
else
  zstyle ':completion:*' list-colors ""
  setopt list_types
fi

# Set color aliases.
alias -- ls='ls --color=auto'
alias -- grep='grep --color=auto'

# Fish-like syntax highlighting if available.
if [ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -- end -- vim:ft=zsh:
