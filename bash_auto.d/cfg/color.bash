# This file is sourced by .bashrc. This script contains
# a set of color-improved aliases.

options_grep="${options_grep} --color=auto"

if ! installed dircolors
then return 0
else
	eval $(dircolors -b)
fi

options_ls="${options_ls} --color=auto"

alias ls="ls ${options_ls}"
alias grep="grep ${options_grep}"

# -- end -- vim:ft=sh:
