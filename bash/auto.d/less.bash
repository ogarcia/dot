# This file is sourced by .bashrc. This script contains
# a set of options for the program less(1) (another pager)

# If less(1) is not installed into PATH then continue the
# loading of other files in bash_autoload.d directory.
if ! installed less
	then return 0
fi

# Set a fancy status bar un less(1) program.
in_mprompt="    ?ltLine %lt-%lb ?pt(%pt\%).:?btByte..     [?f%f:*stdin*.] ?m(%i-%m).   "
export LESS="-J -K -M -x4 -PM[1;34;43m$in_mprompt[0;0m"

# SuSE doesn't support "raw" control characters.
{ [ -e "/etc/SuSE-release" ] && export LESS="-R $LESS"; } || export LESS="-r $LESS"

# By default use less(1) in raw mode (allow color codes
# and more).
alias less='less -R'

# -- end -- vim:ft=sh:
