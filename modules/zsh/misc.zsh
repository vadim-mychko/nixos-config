# ============================== AUTO COMPLETION ==============================
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
_comp_options+=(globdots)

# ============================== INITIALIZATION ===============================
source <(fzf --zsh)
eval "$(zoxide init zsh)"
