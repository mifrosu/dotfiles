# vim:ft=zsh ts=2 sw=2 sts=2
PROMPT='
%{$fg[yellow]%}%n@%m:%{$fg[white]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) ⌚ %{$fg[white]%}%*%{$reset_color%}
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
