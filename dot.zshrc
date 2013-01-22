## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

# home and end key

bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

### 
# Set shell options
###
setopt auto_menu          # 補完キー連打で次の候補     
setopt auto_param_slash   # 補完の時/を自動で入れる 
setopt rm_star_silent     # rm * のとき確認
setopt extended_glob      # ファイル名の指定が柔軟になる *.(cpp|h)
setopt list_types         # ファイル種別をマーク表示
setopt no_beep            # ビープ音鳴らさない
setopt always_last_prompt # カーソル位置を動かさずファイル名一覧を表示
setopt auto_param_keys    # カッコの対応などを補完
setopt prompt_subst       # プロンプトに環境変数を通す
setopt hist_ignore_dups   # ignore duplication command history list
setopt share_history      # share command history data
setopt auto_pushd         # ふつーにcdするときもスタックに入れる
setopt pushd_ignore_dups  # スタックから重複を削除
setopt hist_ignore_space  # 行頭にスペースがあったらhistoryに保存しない

unsetopt extended_history   # 履歴に時間を記録
unsetopt sun_keyboard_hack  # `のtypoをカバーする

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
autoload -U compinit
compinit -u
autoload vcs_info

# VCS settings

# ほか設定
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

zstyle ':completion:*' list-colors 'no=00' 'fi=00' 'di=00;34' 'ln=01;36' 'pi=40;33' 'so=40;33' 'bd=40;33' 'cd=40;33' 'ex=01;31' 'or=04;36' '*.tgz=01;32' '*.gz=01;32' '*.tar=01;32'

# apt-getとか時間のかかるコマンドにキャッシュを使う
zstyle ':completion:*' use-cache true
# 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
zstyle ':completion:*:default' menu select=1

# for git
#zstyle ":vcs_info:*" enable git

# commitしていない変更をチェックする
#zstyle ":vcs_info:git:*" check-for-changes true
# gitリポジトリに対して、変更情報とリポジトリ情報を表示する
#zstyle ":vcs_info:git:*" formats "%c%u%b"
# gitリポジトリに対して、コンフリクトなどの情報を表示する
#zstyle ":vcs_info:git:*" actionformats "%c%u<%a>[%b:%r]"
# addしていない変更があることを示す文字列
#zstyle ":vcs_info:git:*" unstagedstr "%F{red}"
# commitしていないstageがあることを示す文字列
#zstyle ":vcs_info:git:*" stagedstr "%F{yellow}"

PROMPT=$'%{\e[36m%}%T%%%{\e[m%}`_git_not_pushed` '
RPROMPT=$'[`prompt-svn``rprompt-git` %{\e[36m%}%~]%{\e[m%}'
PROMPT2="%_%% "


function rprompt-git {
	if test -z $(git rev-parse --git-dir 2> /dev/null); then 
	  return 
	fi 
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
        if [[ -z $name ]]; then
                return
        fi

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

# push忘れ防止関数
# http://yuroyoro.hatenablog.com/entry/20110219/1298089409
function _git_not_pushed()
{
  if test -z $(git rev-parse --git-dir 2> /dev/null); then 
      return 
  fi 
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = "true" ]; then
        head="$(git rev-parse HEAD)"
        for x in $(git rev-parse --remotes)
        do
            if [ "$head" = "$x" ]; then
                return 0
            fi
        done
        echo "%B%F{red}{PUSH忘れ}%f%b"
    fi
    return 0
}

function prompt-svn {
    local __svn_status st revision
    __svn_status=(`svn info 2> /dev/null |grep 'リビジョン: '`)
    if [[ $__svn_status  == '' ]]
    then
        return
    fi
    
    revision=`echo ${__svn_status[2]}`
    
    st=`svn status 2> /dev/null`
    
    if [[ -n `echo "$st" | grep "^M"` ]]; then
        color=%F{red}
    elif [[ -n `echo "$st" | grep "^?"` ]]; then
        color=%F{magenta}
    elif [[ -n `echo "$st" | grep "^D"` ]]; then
        color=%F{magenta}
    elif [[ -n `echo "$st" | grep "^ M"` ]]; then
        color=%F{red}
    else
        color=%F{green}
    fi
    echo "$color$revision%f"
}


## Default shell configuration

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm)
  precmd() {
    echo -n "\e]2;$(date)\a"
  }
  ;;
esac

# ターミナルタイトル
preexec () { print -Pn "\e]0;$1\a" }

#aliases

alias where="command -v"

#alias ls="ls --color=auto"
alias ls="ls -G"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'

# alias for Ruby on Rails
alias buinit="bundle && rake db:migrate parallel:prepare"
alias be="bundle exec"

alias du="du -h"
alias df="df -h"

# alias for git
alias gl="git log --pretty='format:%C(blue)%h%C(red)%d%C(yellow) %s %C(green)%an%Creset, %ar' --graph"

alias globalip='curl ipcheck.ieserver.net'

# for colorized svn diff
alias svndiff="svn diff . | /usr/share/vim/vim73/macros/less.sh"

