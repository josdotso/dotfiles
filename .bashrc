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

# powerline-go
command -v powerline-go || go get -u github.com/justjanne/powerline-go
if $(command -v powerline-go); then
  function _update_ps1() {
    PS1="$(powerline-go -error ${?})"
  }
  if [ "${TERM}" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; ${PROMPT_COMMAND}"
  fi
fi 

# vim
export EDITOR=vim

# ls
alias ls='ls --color'
alias ll='ls -l --color'

# grep
alias grep='grep --color'
