# This file is sourced by .zshrc. This script configures a set of shell
# options.

setopt prompt_subst pushd_silent auto_param_slash auto_list \
       list_rows_first hist_reduce_blanks chase_dots \
       pushd_ignore_dups auto_param_keys hist_ignore_all_dups \
       mark_dirs complete_in_word cdablevars interactive_comments \
       print_eight_bit always_last_prompt auto_menu
unsetopt auto_list menu_complete list_ambiguous pushd_to_home

# -- end -- vim:ft=zsh:
