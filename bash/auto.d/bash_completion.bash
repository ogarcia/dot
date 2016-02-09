# This file is sourced by .bashrc. This script load bash
# completion functionality if it's enabled in the system.

[ -f /etc/bash_completion ] && \
	. /etc/bash_completion

for in_comp in "${completion_dir}/"*.bash; do
  [ "${in_comp}" != "${completion_dir}/*.bash" ] && mute source "${in_comp}"
done

# -- end -- vim:ft=sh:
