set fish_greeting

if status is-interactive
    function getenv; set -gx $argv; end
    function getalias; abbr -ag $argv; end
    function getpath; set -x fish_user_paths $argv; end
    source ~/.config/environment
    zoxide init fish | source
end
