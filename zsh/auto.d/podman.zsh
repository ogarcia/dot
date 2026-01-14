# This file is sourced by .zshrc. This script contains a set of helpers for
# use with podman(1).

if ! installed podman
  then return 0
fi

# Make config persistent
export REGISTRY_AUTH_FILE="${XDG_CONFIG_HOME:-$HOME/.config}"/containers/auth.json

# Run a container with current dir as datadir
_pshell () {
  local entrypoint="$(mktemp -t entrypoint-XXXX)"
  local shell=${1}
  shift
  # Creates a home directory for your user in container
  cat << EOF > ${entrypoint}
#! /bin/sh
mkdir /home/${USER}
chown ${UID}:${GID} /home/${USER}
if [ \${#} -gt 0 ];then
  exec \$@
else
  ${shell}
fi
EOF
  chmod +x ${entrypoint}
  podman run -t -i -v ${entrypoint}:/entrypoint.sh -v ${PWD}:/data --rm -w /data \
    --passwd-entry "${USERNAME}:*:${UID}:${GID}::${HOME}:${shell}" \
    --userns=keep-id --user root --entrypoint /entrypoint.sh ${@}
  rm ${entrypoint}
}

# Some fancy aliases
alias -- psh="_pshell /bin/sh"
alias -- pbash="_pshell /bin/bash"
alias -- palpine="_pshell /bin/sh docker.io/alpine:latest"
alias -- parch="_pshell /bin/bash docker.io/ogarcia/archlinux:devel"

# -- end -- vim:ft=zsh:
