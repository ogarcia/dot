# This file is sourced by .bashrc. This script configures the PATH variable.

if [ -d "${XDG_BIN_HOME:-${HOME}/.local/bin}" ] ; then
  PATH="${PATH}:${XDG_BIN_HOME:-${HOME}/.local/bin}"
fi

for _path in \
  ${HOME}/.gem/ruby/*/bin \
  /opt/*/sbin \
  /opt/*/bin \
  /opt/*/usr/bin \
  /opt/*/usr/sbin \
  /opt/*/usr/local/bin \
  /opt/*/usr/local/sbin ; do
  [ "${_path//\*/}" == "${_path}" ] && PATH="${_path}:${PATH}"
done

export PATH

# -- end -- vim:ft=bash:
