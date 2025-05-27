# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check window size after each command
[[ $DISPLAY ]] && shopt -s checkwinsize

# Initialize interactive mode, prevent loading twice
if [ -z "$_INIT_SH_LOADED" ]; then
    _INIT_SH_LOADED=1
else
    return
fi

# Delete duplicated path
if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}
        case $PATH: in
           *:"$x":*) ;;
           *) PATH=$PATH:$x;;
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi
export PATH

# History
export HISTCONTROL=ignoredups
shopt -s histappend
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTFILE=$XDG_DATA_HOME/.bash_history

# Prompt
PS1='\u@\h \W> '

# Variable
function getvar {
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
source ~/.config/environment

# z
eval "$(zoxide init bash)"
