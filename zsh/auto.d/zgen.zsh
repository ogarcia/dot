# This file is sourced by .zshrc. This script loads zgen functionality where
# available.

if [[ -r ~/.zsh/zgen/zgen.zsh ]]; then
  ZGEN_DIR=~/.zsh/zgen
  source ~/.zsh/zgen/zgen.zsh
  if ! zgen saved; then
    zgen load zsh-users/zsh-completions src
    zgen load Tarrasch/zsh-autoenv
    zgen load aperezdc/virtualz
    zgen save
  fi
fi

# -- end -- vim:ft=zsh:
