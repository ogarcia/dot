# This file is sourced by .zshrc. This script contains a set of helpers for
# use with docker(1).

if ! installed docker
  then return 0
fi

# Follow XDG Base Directory specification
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"/docker

# Clean the docker house
dclean () {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# Remove stopped docker
drm () {
  local state=$(docker inspect --format "{{.State.Running}}" ${1} 2>/dev/null)
  [[ "$state" == "false" ]] && docker rm ${1}
}

# Run a docker with sh and current dir as datadir
dsh () {
  docker run -t -i -v ${PWD}:/data --rm --entrypoint /bin/sh ${@}
}

# Run a docker with bash and current dir as datadir
dbash () {
  docker run -t -i -v ${PWD}:/data --rm --entrypoint /bin/bash ${@}
}

# Some fancy aliases
alias -- dps="docker ps -a"
alias -- dalpine="dsh alpine:latest"
alias -- darch="dbash ogarcia/archlinux:devel"

# -- end -- vim:ft=zsh:
