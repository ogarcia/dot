# This file is sourced by .zshrc. This script configures a set of curl
# commodities.

if ! installed curl
  then return 0
fi

ipecho () { { curl -s -m 2 ip.connectical.com || curl -s api.ipify.org; } && echo }

ipinfo () { curl -s "ipinfo.io/${1}" && echo }

meteo () { curl -s "wttr.in/${1}" | grep -v -e 'igor_chubin' }

pagestats () {
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

port () {
  [[ ${1} =~ ^-[46]+$ ]] && _prot=${1#-} && shift
  _ret=$(curl -f -s -${_prot:-4} ifconfig.co/port/${1}) || \
    { echo "Error on request" && return 1; }
  echo ${_ret} | sed -e 's/{/{\n  /' -e 's/,/,\n  /g' -e 's/}/\n}/'
  unset _ret _prot
}

# -- end -- vim:ft=zsh:
