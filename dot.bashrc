export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH stuff
function prepend_to_var() {
  eval value=\$${1}
  if [[ $value != *:${2}:* && $value != ${2}:* && $value != *:${2} && $value != ${2} ]]; then
    if [ -z "${value}" ]; then
      export ${1}="${2}"
    else
      export ${1}="${2}:${value}"
    fi
  fi
}

if [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  # this is the hack to avoid prepending system paths in subshells
  unset PATH
  unset MANPATH
  eval $(/usr/libexec/path_helper -s)
fi

prepend_to_var PATH '/sbin'
prepend_to_var PATH '/usr/sbin'
prepend_to_var PATH '/usr/local/sbin'
prepend_to_var PATH "${HOME}/bin"

if ! tty -s; then return; fi # exit if non interactive shell

if [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  BREW_PREFIX=$(brew --prefix)
  export BASH_COMPLETION_COMPAT_DIR="${BREW_PREFIX}/etc/bash_completion.d"
  if [ -r "${BREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
    . "${BREW_PREFIX}/etc/profile.d/bash_completion.sh"
  fi

  alias sudoedit='sudo -e'
  alias ls='gls -F --color=auto --group-directories'
  alias dircolors='gdircolors'
else
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
  fi

  alias ls='ls -F --color=auto --group-directories'
fi

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
cd
