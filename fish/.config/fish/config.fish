set -g fish_greeting

function getvar; set -gx $argv; end
function getalias; abbr -ag $argv; end
function getpath; fish_add_path -g $argv; end
source ~/.config/environment

function pathclean --description "Clean up PATH variable"
    set PATH (printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
end

zoxide init fish | source
