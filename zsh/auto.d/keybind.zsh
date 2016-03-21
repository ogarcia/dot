# This file is sourced by .zshrc. This script configures zsh key bindings.

# Bind Ctrl-Left and Ctrl-Right key sequences, and AvPag/RePag for history
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward

# Make AvPag/RePag work in long menu selection lists
zmodload -i zsh/complist
bindkey -M menuselect "\e[5~" backward-word
bindkey -M menuselect "\e[6~" forward-word
bindkey -M menuselect "\e"    send-break

# Bind Delete/Begin/End for Zsh setups that do not include those by default
# (screen, tmux, rxvt...)
bindkey "^[OH"  beginning-of-line
bindkey "^[[H"  beginning-of-line
bindkey "^A"    beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OF"  end-of-line
bindkey "^[[F"  end-of-line
bindkey "^E"    end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

# -- end -- vim:ft=zsh:
