# This file is sourced by .bashrc. This script load bash
# completion functionality if it's enabled in the system.

[ -f /etc/bash_completion ] && \
	. /etc/bash_completion

if [ -d ~/.bash_completion.d/ ]; then
	for mod in ~/.bash_completion.d/* ; do
		. $mod
	done
fi

# -- end -- vim:ft=sh:
