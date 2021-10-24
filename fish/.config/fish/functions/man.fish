function man --description "manpages using the less pager but with colors"

    set -x LESS_TERMCAP_md (echo -e '\e[01;31m')
    set -x LESS_TERMCAP_me (echo -e '\e[0m')
    set -x LESS_TERMCAP_se (echo -e '\e[0m')
    set -x LESS_TERMCAP_so (echo -e '\e[01;44;33m')
    set -x LESS_TERMCAP_ue (echo -e '\e[0m')
    set -x LESS_TERMCAP_us (echo -e '\e[01;32m')

    command man $argv
end
