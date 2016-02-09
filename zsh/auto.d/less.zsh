# This file is sourced by .zshrc. This script contains a set of options for
# the program less(1) (another pager).

if ! installed less
	then return 0
fi

# Set a fancy status bar un less(1) program.
in_mprompt="    ?ltLine %lt-%lb ?pt(%pt\%).:?btByte..     [?f%f:*stdin*.] ?m(%i-%m).   "
export LESS="-J -K -M -x4 -PM[48;5;233m[38;5;75m$in_mprompt[0;0m"

# SuSE doesn't support "raw" control characters.
{ [ -e "/etc/SuSE-release" ] && export LESS="-R $LESS"; } || export LESS="-r $LESS"

# TERMCAP codes
# vb      flash     emit visual bell
# mb      blink     start blink
# md      bold      start bold
# me      sgr0      turn off bold, blink and underline
# so      smso      start standout (reverse video)
# se      rmso      stop standout
# us      smul      start underline
# ue      rmul      stop underline
export LESS_TERMCAP_mb=$'\e[48;5;196m\e[38;5;190m'
export LESS_TERMCAP_md=$'\e[1m\e[38;5;75m'
export LESS_TERMCAP_me=$'\e[0;0m'
export LESS_TERMCAP_so=$'\e[48;5;235m\e[38;5;242m'
export LESS_TERMCAP_se=$'\e[0;0m'
export LESS_TERMCAP_us=$'\e[38;5;71m'
export LESS_TERMCAP_ue=$'\e[0;0m'

# By default use less(1) in raw mode (allow color codes
# and more).
alias -- less='less -R'

# -- end -- vim:ft=sh:
