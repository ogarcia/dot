# This file is sourced by .zshrc. This script contains a set of helpers for
# use with go (Compiler and tools for the Go programming language).

if ! installed go
	then return 0
fi

[ ! -d ~/.local/go ] && mkdir -p ~/.local/go

export GOPATH=~/.local/go
export PATH=${PATH}:~/.local/go/bin

# -- end -- vim:ft=zsh:
