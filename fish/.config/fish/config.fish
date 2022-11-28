set fish_greeting

if status is-interactive
    function getenv; set -gx $argv; end
    function getalias; abbr -ag $argv; end
    function getpath; set -x fish_user_paths $argv; end
    source ~/.config/environment
    zoxide init fish | source
    function fish_prompt
        echo (set_color 81c8be)(whoami)(set_color ffffff)@(set_color 81c8be)(hostnamectl --static) (set_color eebebe)(date +"%F %a %T") (set_color 8caaee)(pwd)
        echo "\$ "
    end
end

