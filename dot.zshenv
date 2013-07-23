PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export SVN_EDITOR=emacs
export PATH=$PATH:~/sh:/usr/local/bin

# for emacs which installed by brew. Prease search more cool method
export PATH=/usr/local/Cellar/emacs/24.3/bin:$PATH

# for Play Framework
export _JAVA_OPTIONS="-Xms256m -Xmx256m"

# # Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

