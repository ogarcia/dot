# This file is sourced by .zshrc. This script contains a set of helpers for
# use with podman(1).

if ! installed podman
  then return 0
fi

# Make config persistent
export REGISTRY_AUTH_FILE="${XDG_CONFIG_HOME:-$HOME/.config}"/containers/auth.json

# Run a container with current dir as datadir
_pshell () {
  podman run -t -i -v ${PWD}:/data --rm --userns=keep-id --user root --entrypoint ${@}
}

# Some fancy aliases
alias -- psh="_pshell /bin/sh"
alias -- psh="_pshell /bin/bash"
alias -- palpine="_pshell /bin/sh docker.io/alpine:latest"
alias -- parch="_pshell /bin/bash docker.io/ogarcia/archlinux:devel"

# -- end -- vim:ft=zsh:
