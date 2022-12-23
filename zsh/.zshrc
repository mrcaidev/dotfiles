alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="grep -n --color=auto"
alias ls="ls --color=auto"
alias ll="ls -hlv --color=auto"
alias la="ls -ahlv --color=auto"
alias mkdir="mkdir -pv"
alias mv="mv -n"
alias ping="ping -c 3"
alias up="sudo pacman -Syu"

clone() {
    if [[ $1 =~ "/" ]]
    then
        git clone git@github.com:$1.git $2
    else
        git clone git@github.com:mrcaidev/$1.git $2
    fi
}

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
