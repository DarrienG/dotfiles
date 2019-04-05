# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="zhann"

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

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export PATH="/usr/local/sbin:$PATH"
. /usr/share/z/z.sh
. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/dglasser/.sdkman"
[[ -s "/home/dglasser/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dglasser/.sdkman/bin/sdkman-init.sh"

fpath=(/home/darrien/.zsh/gradle-completion $fpath)
