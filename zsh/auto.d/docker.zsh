# This file is sourced by .zshrc. This script contains a set of helpers for
# use with docker(1).

if ! installed docker
	then return 0
fi

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

# Some fancy aliases
alias -- dps="docker ps -a"

# -- end -- vim:ft=zsh:
