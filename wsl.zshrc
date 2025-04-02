# alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cat="bat"
alias diff="diff --color=auto"
alias df="duf"
alias du="dust"
alias find="fd"
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
export WINDOWS_IP=$(ip route show | grep -i default | awk '{ print $3}')
export HTTP_PROXY=http://$WINDOWS_IP:10808
export http_proxy=$HTTP_PROXY
export HTTPS_PROXY=http://$WINDOWS_IP:10808
export https_proxy=$HTTPS_PROXY
export NO_PROXY="localhost,127.*,10.*,172.16.*,172.17.*,172.18.*,172.19.*,172.20.*,172.21.*,172.22.*,172.23.*,172.24.*,172.25.*,172.26.*,172.27.*,172.28.*,172.29.*,172.30.*,172.31.*,192.168.*"
export no_proxy=$NO_PROXY

# starship
eval "$(starship init zsh)"
