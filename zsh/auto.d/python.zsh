# This file is sourced by .zshrc. This script provide a suite of python(1)
# specified utils.

if ! installed python; then
	return 0
fi

if [ -r "${HOME}/.pythonrc.py" ] ; then
	export PYTHONSTARTUP="${HOME}/.pythonrc.py"
fi

if [ -r /usr/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME="${HOME}/.virtualenvs"
  export PROJECT_HOME="${HOME}/Devel"
  export VIRTUAL_ENV_DISABLE_PROMPT=false
  source /usr/bin/virtualenvwrapper.sh
fi

# -- end -- vim:ft=zsh:
