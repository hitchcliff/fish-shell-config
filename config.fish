if status is-interactive
    # Commands to run in interactive sessions can go here
end

function shorten_dir

set -g fish_prompt_pwd_dir_length 1
set realhome ~

set_color 212922
echo $PWD | sed -e "s|^$realhome|~|" -re 's-([^/.]{'"$fish_prompt_pwd_dir_length"'})[^/]*/-\1/-g';

end

function strip_basename

echo (string split -r -m1 (basename $PWD) (shorten_dir))[1]

end

function color_user

echo (set_color e47200 --reverse --bold) (user) (set_color normal); 

end

function fish_prompt

echo (color_user) (strip_basename)(set_color C3DF47)(basename $PWD)(set_color 294936) on(set_color 2BC)(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')(set_color ffffff) '❌ ';

end
