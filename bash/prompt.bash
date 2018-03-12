#/usr/bin/env bash

git_branch() {
  /usr/bin/env git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'}
}

git_dirty() {
  status=$(/usr/bin/env git status 2>/dev/null)

  if [ -n "$status" ]
  then
    clean=$(echo $status | tail -n 1 | grep "nothing to commit, working tree clean")
    if [ -n "$clean" ]
    then
      echo "on \[\033[1;32m\]$(git_branch)\[\033[0m\] "
    else
      echo "on \[\033[1;31m\]$(git_branch)\[\033[0m\] "
    fi
  fi
}

unpushed() {
  /usr/bin/env git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push() {
  if [ -n "$(unpushed)" ]
  then
    echo "with \[\033[1;35m\]unpushed\[\033[0m\] "
  fi
}

dir_name(){
  echo "\[\033[1;36m\]\W/\[\033[0m\] "
}

set_prompt() {
  export PS1="\n$(dir_name)$(git_dirty)$(need_push)› "
}

export PROMPT_COMMAND=set_prompt
export PS1="\n$(dir_name)$(git_dirty)$(need_push)› "
