# zsh_auto
# ---------
# Copyright (c) 2016-2024  Connectical
# Óscar García Amor, Andrés J. Díaz, Adrián Pérez de Castro
#
# This file is sourced by all *interactive* zsh shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. So make sure this doesn't display
# anything or bad things will happen!
#
# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain
# from outputting anything in those cases.

# **If you want to specified some personal options, see
# ``.zsh/auto.d`` directory**
auto_dir=${ZSH_AUTODIR:-~/.zsh/auto.d}
private_auto_dir=${ZSH_PRIVATEAUTODIR:-~/.zsh/private_auto.d}
local_auto_dir=${ZSH_LOCALAUTODIR:-~/.zsh/local_auto.d}

# Be XDG Base Directory Specification friendly
zsh_cache_dir=${ZSH_CACHE_DIR:-${XDG_CACHE_HOME:-~/.cache}/zsh}
[ ! -d ${zsh_cache_dir} ] && mkdir -p ${zsh_cache_dir}
[ ! -d ${XDG_STATE_HOME:-~/.local/state} ] && \
  mkdir -p ${XDG_STATE_HOME:-~/.local/state}

# Define some usefull functions
mute () { { "$@" } 2>/dev/null >/dev/null; }
installed () { { type -p "$1" } 2>&1 > /dev/null; }

# By default no beep and no give no match errors on wildcard sustitutions.
unsetopt beep nomatch

# Set default emacs key binds.
bindkey -e

# Set special variables to autoload plugins. This variables must not be
# exported.
OS="$(uname)"
FROM="${SSH_CLIENT%% *}"

# Set a default basic prompt.
PROMPT=$'<%n@%m> [%~]%# '

# Export possible PATH modifications.
export PATH

# Load auto_dir, private_auto_dir and local_auto_dir contents.
for src in "${auto_dir}/"*.zsh; do
  [ "${src}" != "${auto_dir}/*.zsh" ] && mute source "${src}"
done
for private_src in "${private_auto_dir}/"*.zsh; do
  [ "${private_src}" != "${private_auto_dir}/*.zsh" ] && mute source "${private_src}"
done
for local_src in "${local_auto_dir}/"*.zsh; do
  [ "${local_src}" != "${local_auto_dir}/*.zsh" ] && mute source "${local_src}"
done

# Free all *in*ternal variables at this moment. It's postcondition. At
# this point none variable must be used by zsh_auto
for in_var in $(typeset +m options_*) $(typeset +m in_*); do unset ${in_var}; done
unset OS FROM src private_src local_src in_var

# -- end --
