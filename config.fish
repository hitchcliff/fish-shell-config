if status is-interactive
    # Commands to run in interactive sessions can go here
end

#removes the default greeting message
set fish_greeting ""

function shorten_dir
set -g fish_prompt_pwd_dir_length 1
set realhome ~

set_color D3D7CF
echo $PWD | sed -e "s|^$realhome|~|" -re 's-([^/.]{'"$fish_prompt_pwd_dir_length"'})[^/]*/-\1/-g';
end

function strip_basename
echo (string split -r -m1 (basename $PWD) (shorten_dir))[1]
end

function getCurrentUsername
echo (git config user.name)
end

function color_user
echo (set_color 4E9A06 --reverse --bold) (getCurrentUsername) (set_color normal); 
end

function gitCurrentBranch
echo (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/');
end

function fish_prompt
#echo (color_user) (strip_basename)(set_color EEEEEC)(basename $PWD)(set_color 8AE234)(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')(set_color ffffff) '$ '
echo (color_user) (strip_basename)(set_color EEEEEC)(basename $PWD)(set_color 8AE234)(gitCurrentBranch)(set_color normal) '$ ';
end


# PATH
set PATH /home/notkev1n/mobile-dev/flutter/bin $PATH
set PATH /home/notkev1n/Browserstack $PATH
