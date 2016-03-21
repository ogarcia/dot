# This file is sourced by .zshrc. This script configures zsh color support.

autoload -U colors
colors

zstyle ':completion:*' list-colors ""
setopt list_types

options_grep="${options_grep} --color=auto"

# Only with supported terminals
case ${TERM} in
	xterm* | screen* | *color )
		export CLICOLOR=1
		alias -- grep="grep ${options_grep}"
	;;
esac

# -- end -- vim:ft=zsh:
