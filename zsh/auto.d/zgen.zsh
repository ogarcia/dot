# This file is sourced by .zshrc. This script loads zgen functionality where
# available.

if [[ -r "${zsh_cache_dir}"/zgen/zgen.zsh ]]; then
  ZGEN_DIR="${zsh_cache_dir}"/zgen
  ZGEN_AUTOLOAD_COMPINIT=1
  ZGEN_CUSTOM_COMPDUMP="${zsh_cache_dir}/zgencompdump.${HOST}"
  VIRTUALZ_HOME=~/.local/virtualenvs
  source "${zsh_cache_dir}"/zgen/zgen.zsh
  if ! zgen saved; then
    zgen load zsh-users/zsh-completions src
    zgen load Tarrasch/zsh-autoenv
    zgen load aperezdc/virtualz
    zgen save
  fi
else
  zgen-install () {
    git clone --depth=1 \
      https://github.com/tarjoilija/zgen.git \
      "${zsh_cache_dir}"/zgen && \
      exec "${SHELL}" -l
  }
fi

# -- end -- vim:ft=zsh:
