# alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cat="bat"
alias diff="diff --color=auto"
alias du="dust"
alias grep="grep --color=auto"
alias ip="ip -c=auto"
alias ls="eza --icons"
alias ll="ls -l"
alias la="ls -al"
alias mkdir="mkdir -p"
alias top="btop"

# completion
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# key binding
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word
bindkey "^[[3~" delete-char

# plugin
ZSH_PLUGINS="/usr/share/zsh/plugins"
source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# proxy
export http_proxy="http://127.0.0.1:10808"
export https_proxy="http://127.0.0.1:10808"
export no_proxy="localhost,127.0.0.1,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,.internal"
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export NO_PROXY=$no_proxy
alias unproxy="unset http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY"

# starship
eval "$(starship init zsh)"
