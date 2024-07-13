# ============================== AUTO COMPLETION ==============================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
_comp_options+=(globdots)

# ================================== HISTORY ==================================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ================================= VIM MODE ==================================
bindkey -v
export KEYTIMEOUT=1

# ============================== INITIALIZATION ===============================
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
