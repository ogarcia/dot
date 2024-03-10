# This file is sourced by .zshrc. This script contains a set of commodities
# to use with program ssh(1).

# If ssh(1) no installed into PATH then skip the content of this file and
# continue loading other zsh_auto.d scripts.
if ! installed ssh
  then return 0
fi

# Use GCR ssh-agent
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gcr/ssh"

# Tool to remove offending ssh key
remove-ssh-known-host () {
  [ ! ${1} ] && echo "Missing parameter '<file>:<line>'" && return 1
  [ ! -w ${1%:*} ] && echo "Cannot write in ${1%:*}" && return 1
  [[ ! ${1#*:} =~ ^-?[0-9]+$ ]] && echo "Not a number ${1#*:}" && return 1
  sed -i "${1#*:}d" ${1%:*}
}

# -- end -- vim:ft=zsh:
