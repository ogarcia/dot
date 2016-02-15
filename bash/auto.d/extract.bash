# This file is sourced by .bashrc. This script configures a extract command
# to easy uncompress several files.

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.gz)  tar xvzf $@   ;;
      *.tar.bz2) tar xvjf $@   ;;
      *.tar.xz)  tar xvJf $@   ;;
      *.tgz)     tar xvzf $@   ;;
      *.tbz2)    tar xvjf $@   ;;
      *.txz)     tar xvJf $@   ;;
      *.gz)      gunzip $@     ;;
      *.bz2)     bunzip2 $@    ;;
      *.xz)      unxz $@       ;;
      *.zip)     unzip $@      ;;
      *.Z)       uncompress $@ ;;
      *.7z)      7z x $@       ;;
      *) echo "Sorry, don't know how to extract '$1'..." && return 1 ;;
    esac
  else
    echo "'$1' is not a valid file!" && return 1
  fi
}

# -- end -- vim:ft=zsh:
