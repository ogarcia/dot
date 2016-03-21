# This file is sourced by .zshrc. This script provide a suite of python(1)
# specified utils.

if ! installed python; then
	return 0
fi

if [ -r "${HOME}/.pythonrc.py" ] ; then
	export PYTHONSTARTUP="${HOME}/.pythonrc.py"
fi

# -- end -- vim:ft=zsh:
