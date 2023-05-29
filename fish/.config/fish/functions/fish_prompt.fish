function fish_prompt
    echo (set_color 81c8be)(whoami)(set_color ffffff)@(set_color 81c8be)(hostnamectl --static) (set_color eebebe)(date +"%F %a %T") (set_color 8caaee)(pwd)
    echo "\$ "
end
