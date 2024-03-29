# This file is sourced by .zshrc. This script configures zsh color support.

autoload -U colors
colors

# Set terminal type.
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  case "${TERM}" in
    screen*) export TERM='screen-256color' ;;
    *) export TERM='xterm-256color' ;;
  esac
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

options_grep="${options_grep} --color=auto"
options_ls="${options_ls} --color=auto"

# Set color aliases.
alias -- ls="ls ${options_ls}"
alias -- ll="ls ${options_ls} -l"
alias -- grep="grep ${options_grep}"

# Fish-like syntax highlighting if available.
if [ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -- end -- vim:ft=zsh:
