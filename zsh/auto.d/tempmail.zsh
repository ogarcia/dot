# This file is sourced by .zshrc. This script configures a tempmail and tm
# command that provides temporary email address.

if ! installed curl
  then return 0
fi

tempmail () {
  if rand_name=$(curl -f -s -m 1 https://maildrop.cc/api/suggestion); then
    rand_name=$(echo ${rand_name} | cut -f 4 -d '"')
  else
    [ -c /dev/ramdom ] && dev_rand="/dev/ramdom"
    [ -c /dev/urandom ] && dev_rand="/dev/urandom"
    [ $dev_rand ] || \
      { echo 'Cannot access to a random device' && return 1; }
    rand_name=$(<${dev_rand} tr -dc A-Za-z | head -c 8)
  fi
  echo "Your temp mail is ${rand_name}@maildrop.cc"
  echo "Can access to inbox in https://maildrop.cc/inbox/${rand_name}"
}

alias -- 'tm'=tempmail

# -- end -- vim:ft=zsh:
