HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# autocomplete
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

source <(fzf --zsh)
eval "$(zoxide init zsh)"
