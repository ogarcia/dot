# This file is sourced by .zshrc. This script provide a compatibility with
# vim(1) editor.

if ! installed vim
	then return 0
fi

export EDITOR="$(which vim)"

# -- end -- vim:ft=zsh:
