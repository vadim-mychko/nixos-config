# https://youtu.be/ud7YxC33Z3w?si=0XJlozgWevORbcph
# https://stackoverflow.com/a/24237590
# https://unix.stackexchange.com/a/97844
# ============================== AUTO COMPLETION ==============================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

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

zmodload zsh/terminfo
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end

# ================================= VIM MODE ==================================
bindkey -v
export KEYTIMEOUT=1

# ============================== INITIALIZATION ===============================
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
