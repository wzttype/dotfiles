# Exit for non-interactive shell
[[ $- != *i* ]] && return

# Emacs mode
bindkey -e

# Edit line in vim with C-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Prompt
export PS1="%n@%m %~ "

# Settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.local/share/zsh/zhistory
setopt globdots
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt EXTENDED_HISTORY          # Save time stamps and durations

# Completion
autoload -Uz compinit
compinit -D $HOME/.local/share/zsh/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# z.lua
eval "$(lua ~/.local/bin/z.lua --init bash)"

# Environment
function getenv {
  var="$1"
  shift
  export "$var=$(printf "%s\n" "$@" | paste -s -d: -)"
}
# Alias
function getalias {
  var="$1"
  shift
  alias "$var=$(printf "%s\n" "$@" | paste -s -d: -)"
}
# Path
function getpath {
  var="$1"
  shift
  PATH=$PATH:$1
}
. ~/.config/environment
