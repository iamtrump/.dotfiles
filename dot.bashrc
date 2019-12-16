if [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  alias sudoedit='sudo -e'
  alias ls='gls -F --color=auto --group-directories'
  alias dircolors='gdircolors'
else
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
  fi
  export PATH="/usr/sbin:/sbin:${PATH}"
  alias ls='ls -F --color=auto --group-directories'
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
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- --='cd -'
alias l='ls -1'
alias ll='l -l'
alias la='ll -a'
alias ltr='ll -tr'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
alias grepi='grep -i'
alias e="$EDITOR"
alias bc='bc -lq'
alias mc='mc -b'
alias root='sudo -s -E'

[ -f ~/.dir_colors ] && eval $(dircolors ~/.dir_colors)
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

# splash
if shopt -q login_shell; then
  echo '
              /*             
            /////            
           */////*           
          .///,///,          
         *//,  .///,         
        ///.    .///         
     ,////.      *///        
     *//////,  */////*       
         **/* *///.          
         .//   ///*          
         ./*   *//**         
        *//     .///.        
       .*//      *///        
       *///////***///*       
'
  uptime
fi
cd
