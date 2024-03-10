# This file is sourced by .zshrc. This script provide a suite of python(1)
# specified utils.

if ! installed python; then
	return 0
fi

if [ -r "${XDG_CONFIG_HOME:-${HOME}/.config}/python/pythonrc.py" ] ; then
	export PYTHONSTARTUP="${XDG_CONFIG_HOME:-${HOME}/.config}/python/pythonrc.py"
fi

export PYTHON_HISTORY="${XDG_STATE_HOME:-${HOME}/.local/state}/python_history"

# -- end -- vim:ft=zsh:
