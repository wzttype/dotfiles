set fish_greeting

function fish_prompt
    echo (set_color 81c8be)(whoami)(set_color ffffff)@(set_color 81c8be)(hostnamectl --static) (set_color eebebe)(date +"%F %a %T") (set_color 8caaee)(pwd)
    echo "\$ "
end

function getenv; set -gx $argv; end
function getalias; abbr -ag $argv; end
function getpath; set -x fish_user_paths $argv; end
source ~/.config/environment
if test "$XDG_SESSION_TYPE" = "wayland"
    source ~/.config/environment_wayland
end

zoxide init fish | source
