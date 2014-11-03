# This file is sourced by .bashrc. This script contains
# a set of color-improved aliases.

options_grep="${options_grep} --color=auto"

case ${TERM} in
	xterm* | screen* | *color )
		export CLICOLOR=1
		alias grep="grep ${options_grep}"
	;;
esac

# -- end -- vim:ft=sh:
