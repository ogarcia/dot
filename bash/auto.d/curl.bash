# This file is sourced by .bashrc. This script configures a set of curl
# commodities.

if ! installed curl
  then return 0
fi

alias ipecho='curl ipecho.net/plain; echo'

ipinfo () { curl -s "ipinfo.io/${1}" && echo; }

meteo () { curl -s "meteo.connectical.com/${1}"; }

pagestats() {
  if [ $# -lt 1 ]
  then
    echo 'This command need a URL'
  else
    curl -k -v -w "
time_namelookup:  %{time_namelookup}
time_connect:  %{time_connect}
time_pretransfer:  %{time_pretransfer}
time_redirect:  %{time_redirect}
time_starttransfer:  %{time_starttransfer}
----------
time_total:  %{time_total}
" -o /dev/null -s $@
  fi
}

# -- end -- vim:ft=sh:
