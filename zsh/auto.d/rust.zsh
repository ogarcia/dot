# This file is sourced by .zshrc. This script contains a set of helpers for
# use with Rust.

if ! installed cargo
	then return 0
fi

[ ! -d ~/.local/cargo ] && mkdir -p ~/.local/cargo

export CARGO_HOME=~/.local/cargo
export PATH=${PATH}:~/.local/cargo/bin

# -- end -- vim:ft=zsh:
