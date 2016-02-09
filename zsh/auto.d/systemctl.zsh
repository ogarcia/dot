# This file is sourced by .zshrc. This script configures some systemctl
# helpers.

if ! installed systemctl; then
  return 0
fi

alias -- list="sudo systemctl list-units"
alias -- status="sudo systemctl status"
alias -- start="sudo systemctl start"
alias -- stop="sudo systemctl stop"
alias -- restart="sudo systemctl restart"
alias -- reload="sudo systemctl reload"

# -- end -- vim:ft=zsh:
