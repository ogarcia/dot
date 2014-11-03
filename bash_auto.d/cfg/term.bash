# This file is sourced by .bashrc. This script configures
# some terminals to have full color support.

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	case "$TERM" in
		xterm*) export TERM='xterm-256color' ;;
		screen*) export TERM='screen-256color' ;;
	esac
fi

# -- end -- vim:ft=sh:
