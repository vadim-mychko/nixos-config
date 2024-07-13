HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

# vi mode
bindkey -v
export KEYTIMEOUT=1

source <(fzf --zsh)
eval "$(zoxide init zsh)"
