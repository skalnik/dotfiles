function open_pr --description 'Open the current branch to the GH new PR view in the browser'
  set --local branch (git symbolic-ref HEAD 2>/dev/null | awk -F/ '{print $NF}')
  set --local url (git config --get remote.origin.url | sed 's/\.git//')
  open "$url/compare/$branch?expand=1"
end
