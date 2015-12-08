if [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

export EDITOR='vim'

# history stuff
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# some other opts
shopt -s cdspell
#shopt -s autocd

# prompt
export PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w \[\e[0;32m\]\$\[\e[m\] '
#function _update_ps1() {
#  export PS1="$(~/.powerline-shell.py $?)"
#}
#export PROMPT_COMMAND="_update_ps1"

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
alias sudoedit="sudo $EDITOR"
alias ..='cd ..'

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
