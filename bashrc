# bash_auto
# ---------
# Copyright (c) 2006-2014  Connectical
# Andrés J. Díaz, Adrián Pérez de Castro, Óscar García Amor
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. So make sure this doesn't display
# anything or bad things will happen!
#
# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain
# from outputting anything in those cases.

# **If you want to specified some personal options, see
# ``.bash/auto.d`` directory**
auto_dir=${BASH_AUTODIR:-~/.bash/auto.d}
private_auto_dir=${BASH_PRIVATEAUTODIR:-~/.bash/private_auto.d}
local_auto_dir=${BASH_LOCALAUTODIR:-~/.bash/local_auto.d}
completion_dir=${BASH_COMPLETIONDIR:-~/.bash/completion.d}

# This bash_auto only works with bash >= 3.0
[ "${BASH_VERSION:-0}" '<' "3" ] && return 1

# If not exists the directory autoload, then do nothing.
[ ! -d "$auto_dir" ] && return

# Define some usefull functions
mute () { "$@" 2>/dev/null >/dev/null; }
installed () { type -p "$1" 2>&1 > /dev/null; }

# Clean ``prompt`` variable. This is a precondition to prompt file
# in bash_auto.d if exists.
prompt=

# Set special variables to autoload plugins. This variables must not be
# exported.
OS="$(uname)"
FROM="${SSH_CLIENT%% *}"

shopt -s extglob

# We also export ``PS1`` and ``PROMPT_COMMAND`` variables to environment.
# It's very usefull when run a subshell interactively.
export PS1="[no prompt]$ "

# Load auto_dir and local_auto_dir contents.
for src in "${auto_dir}/"*.bash; do
  [ "${src}" != "${auto_dir}/*.bash" ] && mute source "${src}"
done
for private_src in "${private_auto_dir}/"*.bash; do
  [ "${private_src}" != "${private_auto_dir}/*.bash" ] && mute source "${private_src}"
done
for local_src in "${local_auto_dir}/"*.bash; do
  [ "${local_src}" != "${local_auto_dir}/*.bash" ] && mute source "${local_src}"
done

# Free all *in*ternal variables at this moment. It's postcondition. At
# this point none variable must be used by bash_auto
unset OS FROM src ${!in_*} ${!options_*}

# -- end --
