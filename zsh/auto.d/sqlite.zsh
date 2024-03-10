# This file is sourced by .zshrc. This script provide a suite of sqlite3(1)
# specified utils.

if ! installed sqlite3; then
	return 0
fi

export SQLITE_HISTORY="${XDG_STATE_HOME:-${HOME}/.local/state}/sqlite_history"

# -- end -- vim:ft=zsh:
