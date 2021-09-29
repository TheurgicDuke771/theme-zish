function fish_right_prompt
  set -l exit_code $status
  set_color $fish_color_autosuggestion[1]
  printf $CONDA_PROMPT_MODIFIER
  set_color "FA8D3E"
  printf ' | '
  if test $exit_code -ne 0
    set_color red
  else
    set_color green
  end
  printf '{%d}' $exit_code
  set_color "FA8D3E"
  printf ' | %s' (date +%H:%M:%S)
  set_color normal
end
