#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if type rbenv > /dev/null; then
  eval "$(rbenv init - zsh)"
fi

setopt IGNOREEOF
# auto correct
unsetopt CORRECT

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
