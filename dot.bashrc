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

# splash
if shopt -q login_shell; then
  echo '
                        o/.-                      
                      :+ooo+`                     
                     :ooooo++`                    
                   `::ooooooo/`                   
                   .:ooooooooo+                   
                  `oooo+.+oooo+-                  
                `:/ooo/. -++oooo.                 
                /+ooo+    .ooooo+.                
              .+oooo+      .oooo+/.               
             .ooooo-        `ooooo:-              
          .-:oooo+-          -oooo+/`             
          /+oooooo+/:.    ``./oooooo-             
       `.:+ooooooooo+-   `:++ooooooo.             
            :-/+++/ooo  + ooooo+o+//              
                :-ooo+  .:+oooo:                  
               --:ooo`   -+ooooo                  
               -./oo+     :+ooo+.                 
               -`ooo:     -/oooo:-                
              ../oo+       .o+ooo+.               
              //ooo-        `+oooo/-              
             -:/oo+.         .ooooo/              
            `:+ooo-           -ooooo-             
            .ooooo////////:----/ooooo             
            -oooooooooooooooooooooooo             
            --:::::-::::--.-//+///+::             
  '
fi
uptime

# aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- --='cd -'
alias ls='ls -F'
alias l='ls -1'
alias ll='ls -l'
alias la='ls -la'
alias df='df -h'
alias du='du -h'
alias sudo='sudo '
alias grep='grep --color'
alias grepi='grep -i --color'
alias e="$EDITOR"
alias bc='bc -lq'
alias mc='mc -b'
alias @=at

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
