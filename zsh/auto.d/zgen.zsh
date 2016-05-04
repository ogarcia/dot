# This file is sourced by .zshrc. This script loads zgen functionality where
# available.

if [[ -r ~/.zsh/zgen/zgen.zsh ]]; then
  ZGEN_DIR=~/.zsh/zgen
  ZGEN_AUTOLOAD_COMPINIT=1
  ZGEN_CUSTOM_COMPDUMP=${ZGEN_DIR}/zcompdump
  VIRTUALZ_HOME=~/.local/virtualenvs
  source ~/.zsh/zgen/zgen.zsh
  if ! zgen saved; then
    zgen load zsh-users/zsh-completions src
    zgen load Tarrasch/zsh-autoenv
    zgen load aperezdc/virtualz
    zgen save
  fi
else
  zgen-install () {
    { [[ -d ~/.zsh ]] || mkdir ~/.zsh; } && \
      git clone git://github.com/tarjoilija/zgen ~/.zsh/zgen && \
      exec "${SHELL}" -l
  }
fi

# -- end -- vim:ft=zsh:
