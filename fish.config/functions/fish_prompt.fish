function fish_prompt
  # Last status code if not successful
  set --local last_status $status
  if test $last_status -gt 0
    echo -n "Non-zero exit code: "
    set_color --bold red
    echo $last_status
    set_color normal
  end

  # I like an extra new line between commands
  echo

  if test -n "$CODESPACES"
    set_color --bold normal
    echo -n "💻️🚀 in "
    set_color normal
  end

  # Print current folder, `~` if $HOME
  set_color --bold blue
  if test "$PWD" = "$HOME"
    echo -n "~/"
  else
    echo -n (basename $PWD)"/"
  end
  set_color normal

  fish_vcs_prompt

  echo " › "

  set_theme &
  disown 2>/dev/null
end

function fish_vcs_prompt
  if _jj_repo
    _jj_prompt
  else
    _git_prompt
  end
end

function _git_prompt
  if not command -sq git
    return 1
  end

  set --local git_status (/usr/bin/env git status --no-ahead-behind -uno 2>/dev/null)

  if not test -n "$git_status"
    return 1
  end

  # We are! Lets print some branch info, colored based on tree dirtiness
  set --local branch (/usr/bin/env git symbolic-ref HEAD 2>/dev/null | awk -F/ '{print $NF}')
  set --local clean (echo $git_status | tail -n 1 | grep "nothing to commit")
  set --local unpushed (/usr/bin/env git cherry -v origin/$branch 2>/dev/null)

  echo -n " on "

  if test -n "$clean"
    set_color --bold green
  else
    set_color --bold red
  end

  echo -n $branch
  set_color normal

  # Now, lets check for and announce unpushed commits
  if test -n "$unpushed"
    echo -n " with "
    set_color --bold magenta
    echo -n "unpushed"
    set_color normal
  end
end

function _jj_prompt
  set --local id (jj show -r @ -T 'change_id.shortest()' --no-patch --ignore-working-copy)
  set --local empty (jj show -r @ -T 'empty' --no-patch --ignore-working-copy)

  echo -n " on "
  if test "$empty" = "true"
    set_color --bold yellow
  else
    set_color --bold blue
  end

  echo -n $id
  set_color normal
end

function _jj_repo
  if not command -sq jj
    return 1
  end
  if not jj root --ignore-working-copy --quiet &>/dev/null
    return 1
  end

  return 0
end
