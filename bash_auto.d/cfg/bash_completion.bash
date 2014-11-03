# This file is sourced by .bashrc. This script load bash
# completion functionality if it's enabled in the system.

[ -f /etc/bash_completion ] && \
	. /etc/bash_completion

if installed brew; then
	in_brpr=$(brew --prefix)
	[ -f ${in_brpr}/etc/bash_completion ] && \
		. ${in_brpr}/etc/bash_completion
fi

if [ -d ~/.bash_completion.d/ ]; then
	for mod in $(ls -c1 ~/.bash_completion.d/) ; do
		. ~/.bash_completion.d/$mod
	done
fi

# -- end -- vim:ft=sh:
