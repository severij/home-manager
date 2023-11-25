set_prompt() {

  local last_exit_code=$?

  local user_color="\[\e[0;35m\]"
  local host_color="\[\e[0;36m\]"
  local branch_color="\[\e[0;32m\]"
  local dir_color="\[\e[0;33m\]"

  PS1="┌─┤ $user_color\u\[\e[0m\]@$host_color\h \[\e[0m\]│ "

  local git_branch=$(git branch --show-current 2> /dev/null)

  if [ $git_branch ]; then

    local git_toplevel=$(basename $(git rev-parse --show-toplevel) 2> /dev/null)
    local git_prefix=$(git rev-parse --show-prefix 2> /dev/null)

    PS1+="${branch_color}${git_branch} \[\e[0m\]│ ${dir_color}^/${git_prefix} "
  else
    PS1+="${dir_color}\w "
  fi

  PS1+="\[\e[0m\]\n└─> "
}

export PROMPT_COMMAND="set_prompt"
