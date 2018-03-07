autocmd CursorMoved,InsertLeave **/COMMIT_EDITMSG %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/eg
