## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

### 
# Set shell options
###
setopt auto_menu auto_cd correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars auto_param_keys

setopt prompt_subst

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=%F{green}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=%F{yellow}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=%B%F{red}
        else
                 color=%F{red}
        fi

        echo "$color$name$action%f%b "
}

#source auto-fu.zsh
#zle-line-init () {auto-fu-init;}; zle -N zle-line-init
#zstyle ':completion:*' completer _oldlist _complete

## Default shell configuration

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm)
  precmd() {
    echo -n "\e]2;$(date)\a"
  }
  ;;
esac

# VCS settings

PROMPT=$'%{\e[36m%}%T%%%{\e[m%} '
RPROMPT=$'[`rprompt-git-current-branch`%{\e[36m%}%~]%{\e[m%}'
PROMPT2="%_%% "

# ほか設定
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt auto_pushd	 #ディレクトリ履歴

autoload -U compinit
compinit

zstyle ':completion:*' list-colors 'no=00' 'fi=00' 'di=00;34' 'ln=01;36' 'pi=40;33' 'so=40;33' 'bd=40;33' 'cd=40;33' 'ex=01;31' 'or=04;36' '*.tgz=01;32' '*.gz=01;32' '*.tar=01;32'

# ターミナル
preexec () { print -Pn "\e]0;$1\a" }

#aliases

alias where="command -v"
alias j="jobs -l"

alias ls="ls --color=auto"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias buinit="bundle && rake db:migrate parallel:prepare"
alias bue="bundle exec"
alias buec="CUCUMBER_FORMAT=progress rake parallel:features"
alias buer="DEFER_GC=20 ENABLED_DEFEERD=true rake parallel:spec"

alias du="du -h"
alias df="df -h"

alias bl="bluefish"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export DISABLE_COVERAGE=
# export CUCUMBER_FORMAT=pretty
export PATH=$PATH:~/sh
export COVERAGE=false
export RSPEC_FORMAT=progress
