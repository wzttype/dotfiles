set -U fish_greeting

function fish_prompt
    echo (set_color 81c8be)(whoami)(set_color ffffff)@(set_color 81c8be)(hostnamectl --static) (set_color eebebe)(date +"%F %a %T") (set_color 8caaee)(pwd)
    echo "\$ "
end

function getvar; set -gx $argv; end
function getalias; abbr -ag $argv; end
function getpath; set -x fish_user_paths $argv; end
source ~/.config/environment
function getenv
  if test "$XDG_SESSION_TYPE" = "wayland"
    source ~/.config/environment_wayland
  else
    source ~/.config/environment_X11
  end
end

function pathclean --description "Clean up PATH variable"
    set PATH (printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
end

zoxide init fish | source
