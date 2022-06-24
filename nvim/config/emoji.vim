autocmd CursorMoved,InsertLeave **/COMMIT_EDITMSG %s/:\([^: ]\+\):/\=emoji#for(submatch(1), submatch(0))/eg
autocmd BufRead **/MERGE_MSG %s/Merge branch/\=emoji#for('part_alternation_mark').'erge branch'/eg
