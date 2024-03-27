# This file is sourced by .zshrc. This script configures the mkpass and
# mktoken commands that generate random passwords.

[ -c /dev/ramdom ] && pwd_rand="/dev/ramdom"
[ -c /dev/urandom ] && pwd_rand="/dev/urandom"

[ $pwd_rand ] && \
  mkpass () {
    { [[ $1 =~ ^-?[0-9]+$ ]] && pwd_size=${1#-}; } || pwd_size=12
    <${pwd_rand} tr -dc A-Za-z0-9'!#$%' | head -c${pwd_size} && echo
  }

[ $pwd_rand ] && \
  mktoken () {
    { [[ $1 =~ ^-?[0-9]+$ ]] && pwd_size=${1#-}; } || pwd_size=40
    <${pwd_rand} tr -dc A-Za-z0-9 | head -c${pwd_size} && echo
  }

# -- end -- vim:ft=zsh:
