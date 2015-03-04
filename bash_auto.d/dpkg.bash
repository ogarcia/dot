# This file is sourced by .bashrc. This script contains
# a set of DPKG commodities.

if ! installed dpkg; then
	return 0
fi

# Add portage-utils smiliar stuff for dpkg
alias qlist="dpkg -l"
alias qfile="dpkg -L"

# -- end -- vim:ft=sh:
