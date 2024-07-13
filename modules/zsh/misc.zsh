# ============================== AUTO COMPLETION ==============================
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# ================================= VIM MODE ==================================
bindkey -v
export KEYTIMEOUT=1

# ============================== INITIALIZATION ===============================
source <(fzf --zsh)
eval "$(zoxide init zsh)"
