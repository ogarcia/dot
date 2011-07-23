# This file contains a set of color-improved aliases

options_grep="${options_grep} --color=auto"

[ "${OS}" = "Darwin" ] && case ${TERM} in
	*color | xterm | linux )
		export CLICOLOR=1
		alias grep="grep ${options_grep}"
		return 0
	;;
esac

if ! installed dircolors
then return 0
else
	eval $(dircolors -b)
fi

options_ls="${options_ls} --color=auto"

alias ls="ls ${options_ls}"
alias grep="grep ${options_grep}"

# vim:ft=sh:
