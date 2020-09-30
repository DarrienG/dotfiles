# leave update prompts out of my terminal
DISABLE_AUTO_UPDATE="true"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git brew)

source $ZSH/oh-my-zsh.sh
alias gpb="gp -u origin $(git_current_branch)"

# User configuration
source ~/.osrc
source ~/.myshrc

bindkey '^Y' autosuggest-accept

fpath=(/home/darrien/.zsh/gradle-completion $fpath)
