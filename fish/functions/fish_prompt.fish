function fish_prompt
  # Last status code if not successful
  set --local last_status $status
  if [ $last_status -gt 0 ]
    echo -n "Non-zero exit code: "
    set_color --bold red
    echo $last_status
    set_color normal
  end

  # I like an extra new line between commands
  echo

  if [ -n "$CODESPACES" ]
    set_color --bold normal
    echo -n "💻️🚀 in "
    set_color normal
  end

  # Print current folder, `~` if $HOME
  set_color --bold blue
  echo -n (basename (string replace -r "^$HOME" "~"  $PWD))"/"
  set_color normal

  # Git time. First lets find out if we're even in a git repo
  set --local git_status (/usr/bin/env git status --no-ahead-behind -uno 2>/dev/null)

  if [ "$git_status" ] && not jj root --quiet &>/dev/null
    # We are! Lets print some branch info, colored based on tree dirtiness
    set --local branch (/usr/bin/env git symbolic-ref HEAD 2>/dev/null | awk -F/ '{print $NF}')
    set --local clean (echo $git_status | tail -n 1 | grep "nothing to commit")
    set --local unpushed (/usr/bin/env git cherry -v origin/$branch 2>/dev/null)

    echo -n " on "

    if [ "$clean" ]
      set_color --bold green
    else
      set_color --bold red
    end

    echo -n $branch
    set_color normal

    # Now, lets check for and announce unpushed commits
    if [ "$unpushed" ]
      echo -n " with "
      set_color --bold magenta
      echo -n "unpushed"
      set_color normal
    end
  end

  echo " › "
end
