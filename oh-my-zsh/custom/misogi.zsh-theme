
PROMPT='%(?,%{$fg[cyan]%},%{$fg[red]%})%T$(git_prompt_ahead)%% %{$reset_color%}'
RPROMPT='%{$fg[cyan]%}%~ $(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} !%{$fg[yellow]%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} *"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} x"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} R"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ="

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[red]%} PUSH!!"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%} PULL"

