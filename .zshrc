export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export DEFAULT_USER="$USER"

ZSH_THEME="agnoster"

plugins=(
    git
    gitignore
    tmux
    compleat
    docker
    docker-compose
    go
    go-lang
    history
    vi-mode
    python
    virtualenv
    pyenv
    kubectl
    helm
)

source $ZSH/oh-my-zsh.sh

# history
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5


# history
setopt extendedglob        # enable extended globbing

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^r" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# gnupg
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

# direnv
eval "$(direnv hook zsh)"

# kops - completion
if which kops > /dev/null; then source <(kops completion zsh); fi

# misc
stty erase '^?'
autoload -U +X bashcompinit && bashcompinit

# aliases
if [[ -f ~/.aliases ]]; then source ~/.aliases; fi

# keybase - private shell profile
if [[ -d /keybase/private ]]; then
  # Find this current user's private directory (any dir without a comma in it)
  user_private_dir=$(ls /keybase/private | grep -v ',')
  private_shell_profile="/keybase/private/$user_private_dir/.private_shell_profile"
  if [[ -f "private_shell_profile" ]]; then
      echo "Executing additional shell profile private_shell_profile"
      source $private_shell_profile
  fi
fi

# local config
if [[ -f ~/.zshrc.local ]]; then source ~/.zshrc.local; fi
if [[ -f ~/.zshrc.secret ]]; then source ~/.zshrc.secret; fi
