# This file is sourced by .bashrc. This script contains
# a set of shell options usually disabled.

shopt -s cdspell checkhash histappend cmdhist histverify nocaseglob
shopt -s no_empty_cmd_completion shift_verbose checkwinsize
shopt -s extglob histreedit lithist
set -o hashall -o emacs

HISTCONTROL="ignoreboth"
HISTSIZE="1000"
HISTTIMEFORMAT="%F %T "

# -- end -- vim:ft=sh:
