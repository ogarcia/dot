# This file is sourced by .zshrc. This script configures zsh prompt.

FMT_BRANCH="%{$fg[cyan]%}%b%u%c%{$fg[default]%}" # e.g. master¹²
FMT_ACTION="·%{$fg[green]%}%a%{$fg[default]%}"   # e.g. (rebase)

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg bzr svn
zstyle ':vcs_info:bzr:prompt:*' use-simple true
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' unstagedstr   "%B%{$fg[cyan]%}¹%{$fg[default]%}%b"
zstyle ':vcs_info:*:prompt:*' stagedstr     "%B%{$fg[cyan]%}²%{$fg[default]%}%b"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION} "
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH} "
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

case ${TERM} in
  screen | xterm* | gnome-terminal)
    function precmd {
      vcs_info 'prompt'
      print -Pn "\e]0;%n@%m: %~\a"
      [[ ${TERM} = screen* ]] && echo -ne "\ek$(hostname):${PWD##*/}\e\\"
    }
    function preexec () { print -Pn "\e]0;$1\a" }
  ;;
  *)
    function precmd { vcs_info 'prompt' }
	;;
esac

if [[ ${TERM} = screen* ]] ; then
  preexec () {
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
    echo -ne "\ek$CMD\e\\"
  }
fi


PROMPT=$'%{%F{180}%}${VIRTUAL_ENV:+(${VIRTUAL_ENV##*/}) }%{%b%f%}'
PROMPT+=$'${vcs_info_msg_0_}'
PROMPT+=$'%B%{%(!.$fg[red].$fg[green])%}%(!.%m.<%n@%m>)%b%f '
PROMPT+=$'%{%F{39}%}%B[%(!.%1~.%~)]%b%f'
PROMPT+=$'%(?.%{%F{39}%}.%B%{$fg[red]%})%#%b%f '

unset FMT_BRANCH FMT_ACTION

# -- end -- vim:ft=zsh:
