---
description: Create a pull request with comprehensive description and validation
argument-hint: [base-branch] [from-branch]
allowed-tools: Bash(git:*), Bash(gh:*)
---

# PR

Create a pull request with comprehensive documentation.

**Branches:** $ARGUMENTS

## PR Creation Workflow

### 1. Validate Current State

Use Bash to check:

```bash
git status                    # Check for uncommitted changes
git diff --cached            # Review staged changes
git log origin/main..HEAD    # Review commits to be included
```

### 2. Analyze All Changes

**Review the complete changeset:**

- Use `git diff [base-branch]...HEAD` to see all changes since branch diverged
- Read modified files with Read to understand context
- Identify the scope and purpose of changes
- Note any breaking changes or migrations needed

**NOT just the latest commit - analyze ALL commits in the PR!**

### 3. Run Pre-PR Checks

Execute in sequence:

**Linting and Formatting:**

```bash
# Run formatters
npm run format  # or prettier, biome, etc.
cargo fmt       # for Rust
go fmt ./...    # for Go
```

**Tests:**

```bash
# Run full test suite
npm test
cargo test
go test ./...
pytest
mvn test
```

**Build:**

```bash
# Verify build succeeds
npm run build
cargo build
go build ./...
mvn package
```

### 4. Review with mcp__zen__precommit

Use mcp__zen__precommit for comprehensive validation:

- Security review
- Breaking change detection
- Test coverage verification
- Migration requirements
- Documentation completeness

### 5. Generate PR Description

Create a comprehensive description following this format:

```markdown
## Summary
<1-3 sentence overview of what this PR does and why>

## Changes
<Detailed bullet points of all significant changes>
- Feature: Added X functionality
- Fix: Resolved Y issue
- Refactor: Improved Z component
- Docs: Updated documentation for...

## Technical Details
<Implementation approach, architectural decisions, trade-offs>

## Breaking Changes
<List any breaking changes, or "None">

## Migration Guide
<Steps to migrate if breaking changes exist, or "N/A">

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests pass
- [ ] Manual testing completed
- [ ] Edge cases verified

## Screenshots/Examples
<If UI changes or new features, include examples>

## Checklist
- [ ] Tests pass locally
- [ ] Linter/formatter run
- [ ] Documentation updated
- [ ] Breaking changes documented
- [ ] Ready for review

## Related Issues
Fixes #<issue-number>
Related to #<issue-number>
```

### 6. Create the PR

Use `gh` CLI via Bash:

```bash
# Create PR with description
gh pr create \
  --base main \
  --head feature-branch \
  --title "Clear, descriptive title" \
  --body "$(cat <<'EOF'
<PR description here>
EOF
)"
```

**OR** if using the /git:pr command:

```bash
/git:pr main feature-branch
```

### 7. Post-Creation Tasks

- Add appropriate labels: `gh pr edit <number> --add-label "feature,needs-review"`
- Request reviewers: `gh pr edit <number> --add-reviewer "@teammate"`
- Link to project: `gh pr edit <number> --add-project "Project Name"`
- Check CI status: `gh pr checks`

## PR Best Practices

**Title Guidelines:**

- Use conventional commit format: `feat:`, `fix:`, `refactor:`, `docs:`, etc.
- Be specific and descriptive
- Max 72 characters
- Examples:
  - `feat: add user authentication with JWT tokens`
  - `fix: resolve race condition in order processing`
  - `refactor: extract payment logic into service layer`

**Description Guidelines:**

- Explain WHAT and WHY, not just HOW
- Include context for reviewers
- Link to relevant issues/docs
- Note any manual testing performed
- Highlight areas needing extra review
- Include before/after for visual changes

**Code Guidelines:**

- Small, focused PRs (< 400 lines ideal)
- Single responsibility (one feature/fix per PR)
- All tests passing
- No console.log or debug code
- No commented-out code
- Documentation updated

## Validation Checklist

Before creating PR:

- [ ] All commits are on the feature branch
- [ ] Commits have meaningful messages
- [ ] No merge commits (use rebase if needed)
- [ ] Tests pass locally
- [ ] Linter passes
- [ ] Build succeeds
- [ ] No debug code or TODOs
- [ ] Documentation updated
- [ ] Breaking changes documented

## Tools to Use

- **Git Operations**: Bash(git:*)
- **GitHub CLI**: Bash(gh:*)
- **Pre-PR Review**: mcp__zen__precommit
- **File Reading**: Read (for understanding changes)
- **Code Review**: mcp__zen__codereview (optional, for self-review)

## Output

Provide:

1. PR URL
2. Summary of changes included
3. Any follow-up items
4. Suggested reviewers based on changed files

**Remember: A good PR description saves hours of reviewer time!**
