source $HOME/.gvm/scripts/gvm
export GOPATH="$HOME/go"
export PATH=/usr/local/go/bin:$HOME/go/bin:$HOME/flutter/flutter/bin:$GOPATH/bin:/usr/local/opt/llvm/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/bin:$HOME/Library/Python/2.7/bin
export PATH=$PATH:$HOME/.cargo/bin
:
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l ""'
export EDITOR='lvim'

alias dckr_clr_ctn="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
alias dckr_clr_img='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias ports='lsof -n -P -i | grep LISTEN'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias c='clear'
alias g='git '
alias k='kubectl '
alias h='history'
alias j='jobs -l'
alias d='docker '
alias v='vim .'
alias n='nvim .'
alias lv='lvim .'
alias c='clear'
alias ':q'='exit'
export SP_UNIX_SOCKET=/tmp/spex.sock
