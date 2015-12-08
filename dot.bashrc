if [ $(uname) != 'Darwin' ]; then
  export PATH="/usr/sbin:/sbin:${PATH}"
fi

export PATH="${HOME}/bin:/usr/local/bin:${PATH}"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
