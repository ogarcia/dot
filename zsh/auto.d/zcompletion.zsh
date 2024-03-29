# This file is sourced by .zshrc. This script loads zsh completion
# functionality.

_zsh_completion_cache_dir="${ZSH_COMPLETION_CACHE_DIR:-${zsh_cache_dir}/completion}"
_zsh_compdump_file="${ZSH_CUSTOM_COMPDUMP:-${zsh_cache_dir}/zcompdump.${HOST}}"

[ ! -d "${_zsh_completion_cache_dir}" ] && \
  mkdir -p "${_zsh_completion_cache_dir}"

zsh-completion-clean () {
  rm -vrf "${_zsh_completion_cache_dir}" "${_zsh_compdump_file}"
  mkdir -p "${_zsh_completion_cache_dir}"
  compinit -d "${_zsh_compdump_file}"
}

zstyle :compinstall filename "${HOME}/.zshrc"
autoload -Uz compinit
compinit -d "${_zsh_compdump_file}"

# Use completion cache.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${_zsh_completion_cache_dir}"

# Format completion description and warnings.
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matching %b%d'

# Avoid annoying username completion.
zstyle ':completion:*:complete:(cd|pushd|pd):*' tag-order \
  'local-directories path-directories directory-stack' '*'

# Prevent CVS files from being matched.
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle ':completion:*:cd:*' noignore-parents noparent pwd

# Some completion fine-tuning.
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-prompt "%BMatch %m (%p)%b"
zstyle ':completion:*' menu select
# Removed interactive by segfault (http://www.zsh.org/mla/workers/2016/msg00472.html)
# zstyle ':completion:*' menu select interactive

# Improved processes list on kill completion
zstyle ':completion:*:processes' command 'ps -au${USERNAME} -o pid,user,args'
zstyle ':completion:*:processes-names' command 'ps -au${USERNAME} -o command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:killall:*' force-list always
zstyle ':completion:*:kill:*' force-list always

# WARNING: The menu select may take away the prompt if you press CTRL+C in
# autocompletion. Not is a big problem, but if happens, this is the culprit.

# -- end -- vim:ft=zsh:
