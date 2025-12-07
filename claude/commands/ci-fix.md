---
allowed-tools: Bash(gh:*), Bash(jj:*), Read, Grep, Glob, Edit, WebFetch
description: Diagnose and fix CI failures from a PR URL or number
---

Diagnose and fix CI failures for: $ARGUMENTS

## Steps

1. **Fetch CI status and logs**
   - If given a PR number/URL, run `gh pr checks <number>` to see which checks failed
   - Run `gh run list` to find the relevant workflow run
   - Use `gh run view <run-id> --log-failed` to get the failure logs

2. **Identify root cause**
   - Parse the error messages from the logs
   - Determine if it's a build error, test failure, linting issue, or infrastructure problem

3. **Find relevant code**
   - Use `Grep` and `Glob` to locate the files mentioned in the error
   - Read the relevant source code to understand the context

4. **Propose and apply fix**
   - If the fix is straightforward (test failure, lint error, build issue), apply it directly
   - If the fix is ambiguous or risky, explain the options and ask before proceeding
   - After fixing, explain what was wrong and what you changed
