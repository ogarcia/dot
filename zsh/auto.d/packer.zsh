# This file is sourced by .zshrc. This script contains a set of helpers for
# use with Packer from HashiCorp.

if ! installed packer
  then return 0
fi

export PACKER_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}"/packer
export PACKER_CACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}"/packer

# -- end -- vim:ft=zsh:
