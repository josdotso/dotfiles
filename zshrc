# Use $HOME/.local/bin first
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export DEFAULT_USER='rluckie'

ZSH_THEME="agnoster"

plugins=(
    git
    gitignore
    brew
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

# if [[ -r $HOME/.dotfiles/tools/powerline/powerline/bindings/zsh/powerline.zsh ]]; then
#     source $HOME/.dotfiles/tools/powerline/powerline/bindings/zsh/powerline.zsh
# else
#     echo "no powerline.zsh found"
# fi
source $ZSH/oh-my-zsh.sh

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

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

##############################
# GO
##############################
# export GOROOT=/usr/local/Cellar/go/1.8.3/libexec
# export PATH=$PATH:$GOROOT/bin
# export PATH=$PATH:/usr/local/opt/go/libexec/bin
# export GOPATH=$HOME/.go
# export PATH=$PATH:$GOPATH/bin

stty erase '^?'

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit

source <(kops completion zsh)

# # aliases
if [[ -f ~/.aliases ]]; then source ~/.aliases; fi

# # Local config
if [[ -f ~/.zshrc.local ]]; then source ~/.zshrc.local; fi
if [[ -f ~/.zshrc.secret ]]; then source ~/.zshrc.secret; fi
