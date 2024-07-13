# ============================== AUTO COMPLETION ==============================
zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' menu select
_comp_options+=(globdots)

# ================================= VIM MODE ==================================
bindkey -v
export KEYTIMEOUT=1

# ============================== INITIALIZATION ===============================
source <(fzf --zsh)
eval "$(zoxide init zsh)"
