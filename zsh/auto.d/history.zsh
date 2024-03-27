# This file is sourced by .zshrc. This script configures zsh history.

HISTFILE="${XDG_STATE_HOME:-${HOME}/.local/state}"/histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory extendedglob

# Small function to history search
histsearch () { fc -lim "$@" 1 }

# -- end -- vim:ft=zsh:
