# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ${PATH}
export PATH="/usr/local/bin:${PATH}"
export PATH="~/bin:${PATH}"

# Go
export GOPATH="${HOME}/.go"
export PATH="/usr/local/go/bin:${PATH}"
export PATH="${GOPATH}/bin:${PATH}"

# pureline
if [ -d ~/.pureline ]; then
  if [ "$TERM" != "linux" ]; then
    source ~/.pureline/pureline ~/.pureline.conf
  fi
fi

# vim
export EDITOR=vim

# ls
alias ls='ls --color'
alias ll='ls -l --color'

# grep
alias grep='grep --color'
