export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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

function is_exec() {
  [ -x "$(command -v $1)" ]
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

# exit if non interactive shell
if [ -z "$PS1" ]; then
  return
fi

if [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  BREW_PREFIX=$(brew --prefix)
  export BASH_COMPLETION_COMPAT_DIR="${BREW_PREFIX}/etc/bash_completion.d"
  if [ -r "${BREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
    . "${BREW_PREFIX}/etc/profile.d/bash_completion.sh"
  fi

  alias sudoedit='sudo -e'
  is_exec gls && alias ls='gls -F --color=auto --group-directories'
  is_exec gdircolors && alias dircolors='gdircolors'
  is_exec gsed && alias sed='gsed'
else
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
  fi

  alias ls='ls -F --color=auto --group-directories'
fi

export EDITOR='vim'

# history stuff
export HISTSIZE=10000
export HISTCONTROL=ignorespace:erasedups
shopt -s histappend

# some other opts
shopt -s cdspell
shopt -s checkwinsize

# prompt
export PS1='\[\033[0;35m\]\h \[\[\033[0;34m\]\w \[\[\033[0;32m\]\$\[\[\033[m\] '
export PROMPT_DIRTRIM=1

# aliases
alias sudo='sudo '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- --='cd -'
alias l='ls -1'
alias ll='l -l'
alias la='ll -a'
alias ltr='ll -tr'
alias lsr='ll -Sr'
alias df='df -h'
alias du='du -h'
is_exec tailf || alias tailf='tail -f'
alias grep='grep --color'
alias grepi='grep -i'
alias rgrep='grep -r'
alias rgrepi='grep -ir'
alias e="$EDITOR"
alias bc='bc -lq'
alias mc='mc -b'
alias root='sudo -s -E'
alias t='tmux attach -t default'
is_exec colordiff && alias diff='colordiff'

[ -f ~/.dir_colors ] && eval $(dircolors ~/.dir_colors)

[ -f ~/.bash-powerline.sh ] && source ~/.bash-powerline.sh

[ -f ~/.bashrc.local ] && source ~/.bashrc.local

cd ~

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

# tmux
if hash tmux >/dev/null 2>&1; then
  #if not inside a tmux session, and if no session is started, start a new session
  if [ "$TERM" != "screen-256color" ]; then
     tmux attach -t default || tmux new-session -s default
  fi
fi
