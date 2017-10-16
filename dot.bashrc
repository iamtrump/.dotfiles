if [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  #alias sudoedit='sudo vim -u ~/.vimrc'
  alias sudoedit='sudo ${EDITOR}'
else
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
  fi
  export PATH="/usr/sbin:/sbin:${PATH}"
fi

export PATH="${HOME}/bin:/usr/local/bin:${PATH}"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR='vim'

# history stuff
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# some other opts
shopt -s cdspell

# prompt
export PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w \[\e[0;32m\]\$\[\e[m\] '

# aliases
alias ls='ls -F'
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
#alias ssh='ssh -Y'
alias e="$EDITOR"
alias ..='cd ..'
alias ...='cd ../..'
alias -- --='cd -'
alias bc='bc -lq'
alias mc='mc -b'

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
