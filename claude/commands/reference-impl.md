---
allowed-tools: Bash(gh:*), Read, Grep, Glob, WebFetch, WebSearch, Agent
description: Research how open-source projects solve a specific problem
---

Research how open-source projects implement: $ARGUMENTS

## Steps

1. **Search GitHub** for repositories that solve this problem
   - Use `gh search repos` and `gh search code` to find relevant implementations
   - Use `WebSearch` for broader context and blog posts about approaches

2. **Analyze 2-3 approaches** from well-maintained projects
   - Read the relevant source code using `WebFetch` on raw GitHub file URLs
   - Note the trade-offs of each approach (complexity, dependencies, performance)

3. **Summarize findings** with:
   - A brief description of each approach
   - Links to the source code or documentation
   - Key code snippets showing the implementation pattern

4. **Recommend** the best fit for the current project, considering:
   - The project's existing patterns and dependencies
   - Simplicity and maintainability
   - Platform compatibility (macOS/iOS if relevant)
