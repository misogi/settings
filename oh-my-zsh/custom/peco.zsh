
function peco-execute-history() {
  local item
  item=$(builtin history -n -r 1 | peco --query="$LBUFFER")

  if [[ -z "$item" ]]; then
    return 1
  fi

  BUFFER="$item"
  CURSOR=$#BUFFER
  zle accept-line
}

zle -N peco-execute-history

function peco-cdr() {
  local item
  item=$(cdr -l|sed 's/^[^ ]\{1,\} \{1,\} \{1,\}//'| peco)
  if [[ -z "$item" ]]; then
    return 1
  fi

  BUFFER="cd -- $item"
  CURSOR=$#BUFFER
  zle accept-line
}

zle -N peco-cdr

bindkey '^xb' peco-cdr
bindkey '^x^r' peco-execute-history


