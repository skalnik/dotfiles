function __prompt_pwd
  set_color --bold blue
  echo -n (basename (string replace -r "^$HOME" "~"  $PWD))"/"
  set_color normal
end

function __git_branch_status
  set --local git_status (/usr/bin/env git status 2>/dev/null)

  if [ "$git_status" ]
    set --local branch (/usr/bin/env git symbolic-ref HEAD 2>/dev/null | awk -F/ '{print $NF}')
    set --local clean (echo $git_status | tail -n 1 | grep "nothing to commit, working tree clean")

    echo -n " on "

    if [ "$clean" ]
      set_color --bold green
    else
      set_color --bold red
    end

    echo -n (branch)
    set_color normal
  end
end

function __git_needs_push
  set --local branch (/usr/bin/env git symbolic-ref HEAD 2>/dev/null | awk -F/ '{print $NF}')
  set --local unpushed (/usr/bin/env git cherry -v origin/(branch) 2>/dev/null)

  if [ "$unpushed" ]
    echo -n " with "
    set_color --bold magenta
    echo -n "unpushed"
    set_color normal
  end
end

function fish_prompt
  echo
  echo -n (__prompt_pwd)
  echo -n (__git_branch_status)
  echo -n (__git_needs_push)
  echo " › "
end
