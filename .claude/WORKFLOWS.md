# Development Workflows

Common development workflows and process patterns.

## Feature Implementation

1. Create git worktree for isolated development
2. Analyze existing patterns:
   - Code patterns in feature area
   - Test files and testing patterns
   - Dependencies and integration points
   - Similar features in codebase
3. Write tests FIRST (TDD approach)
4. Implement feature following discovered patterns
5. Run tests and verify
6. Create PR using `gh pr create`
7. Remove worktree after merge

### Git Worktrees

- One worktree per Claude session
- Naming: `../project-feature-name`
- Independent environment per worktree
- Remove after PR merge

### Pull Request Pattern

```bash
gh pr create --title "feat: add user auth" --body "$(cat <<'EOF'
## Summary
- Implement OAuth2 authentication
- Add user session management

## Test Plan
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Related Issues
Fixes #123
EOF
)"
```

## Debugging Process

1. Read error message and identify file/line
2. Investigate systematically:
   - Analyze error with 50 lines of context
   - Search for similar error patterns
   - Find tests for affected function/module
   - Check git history for recent changes
3. Use `@error-diagnostician` for complex bugs
4. Propose minimal fix addressing root cause
5. Verify fix doesn't break existing tests

## Code Review Process

1. Fetch PR: `gh pr list --state open`
2. Filter relevant PRs (exclude bots, specific users)
3. For each PR:
   - Fetch diff: `gh pr diff <number>`
   - Use `@code-reviewer` for analysis
   - Focus on bugs, type safety, error handling
   - Show review to user for approval
   - Post: `gh pr comment <number> --body "<review>"`

## Refactoring Process

1. Use `@refactoring-strategist` to analyze code
2. Identify code smells and opportunities
3. Create priority matrix (High/Medium/Low)
4. Develop incremental refactoring plan
5. Write tests to support safe refactoring
6. Execute step-by-step
7. Verify functionality maintained

## Context Window Management

### Priority Information (Always Include)

1. Current task definition
2. Relevant file contents
3. Error messages and stack traces
4. Direct dependencies

### Secondary Information (Include if Space)

1. Related test files
2. Configuration details
3. Similar code examples
4. Historical context

### Exclude Unless Necessary

1. Boilerplate code
2. Unrelated modules
3. Generated files
4. Build artifacts

## Communication Standards

### Response Format

- Be direct and concise (max 4 lines unless asked)
- Use bullet points for multiple items
- Include code snippets when relevant
- Explain reasoning only for significant decisions

### Code Output Format

- Include necessary imports
- Follow project's existing patterns
- Use descriptive variable names
- Add comments only for complex logic

### Error Handling

- Never hide or suppress errors
- Provide clear, actionable error messages
- Include relevant context
- Suggest specific solutions

### Documentation Style

- README files: Maximum 50 lines
- No excessive emojis or decorations
- Essential sections only: Purpose, Quick Start, Key Commands
- Single quick-start command when possible
