export GOPATH="$HOME/go"
export GEM_HOME=$HOME/.gem
export PATH=/usr/local/go/bin:$HOME/go/bin:$PATH
export PATH=$HOME/development/flutter/bin:$GOPATH/bin:/usr/local/opt/llvm/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/bin:$HOME/Library/Python/2.7/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$GEM_HOME/bin:$PATH
export PATH="$HOME/Downloads/zig-macos-aarch64-0.14.0-dev.225+45be80364:$PATH"
export PATH="$HOME/source/flink/apache-maven-3.9.9/bin/:$PATH"

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
alias dcb='docker compose build'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias py='python3'
alias python='python3'
alias z='zellij'

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
