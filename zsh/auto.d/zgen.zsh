# This file is sourced by .zshrc. This script loads zgen functionality where
# available.

if [[ -r ~/.zsh/zgen/zgen.zsh ]]; then
  ZGEN_DIR=~/.zsh/zgen
  ZGEN_AUTOLOAD_COMPINIT=1
  [[ ! -d ~/.zsh/zcompdump ]] && mkdir -p ~/.zsh/zcompdump
  ZGEN_CUSTOM_COMPDUMP=~/.zsh/zcompdump/zgenzcompdump
  VIRTUALZ_HOME=~/.local/virtualenvs
  source ~/.zsh/zgen/zgen.zsh
  if ! zgen saved; then
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load Tarrasch/zsh-autoenv
    zgen load aperezdc/virtualz
    zgen save
  fi
else
  zgen-install () {
    { [[ -d ~/.zsh ]] || mkdir ~/.zsh; } && \
      git clone --depth=1 git://github.com/ogarcia/zgen ~/.zsh/zgen && \
      exec "${SHELL}" -l
  }
fi

# -- end -- vim:ft=zsh:
