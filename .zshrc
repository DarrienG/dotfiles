# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git brew)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source ~/.myshrc
source ~/.osrc

export PATH="/usr/local/sbin:$PATH"
bindkey '^Y' autosuggest-accept

fpath=(/home/darrien/.zsh/gradle-completion $fpath)
