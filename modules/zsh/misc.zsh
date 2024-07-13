autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# =========================== BEGIN INITIALIZATION ============================
source <(fzf --zsh)
eval "$(zoxide init zsh)"
# ============================ END INITIALIZATION =============================
