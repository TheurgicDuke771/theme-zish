# name: Zish

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set_color -o red
  printf '┌─<'
  set_color -o blue
  printf '%s ' (whoami)
  set_color magenta
  printf '@ '
  set_color cyan
  printf '%s ' (hostname|cut -d . -f 1)
  set_color magenta
  printf 'in '
  set_color -o green
  printf '%s' (prompt_pwd)
  set_color -o red
  printf '>'

  echo
  set_color -o red
  printf '└─<'
  set_color yellow
  printf '%s' (__fish_git_prompt)
  if [ (_is_git_dirty) ]
    set_color blue
    printf '* '
  end
  set_color -o red
  printf '>──'
  set_color yellow
  printf '» '
  set_color normal
end