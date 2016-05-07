
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%} ✪%{$reset_color%}"

PROMPT='%{$fg[green]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%} %{$fg[cyan]%}%1~%{$reset_color%}%{$fg[white]%} λ %{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}➔%{$reset_color%} '
RPROMPT='%{$fg[cyan]%} %*%{$reset_color%}'

