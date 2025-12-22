---
description: Comprehensive code review with architecture analysis
argument-hint: [files or PR number]
---

# Review

Comprehensive code review for pull requests, diffs, or specific files.

**Target:** $ARGUMENTS

## Review Protocol

This command performs thorough code review including:

1. **Identify Scope**:
   - For PR: Use `gh pr view <number>` and `gh pr diff <number>`
   - For Files: Read specified files and dependencies
   - For Diff: Run `git diff main` and analyze changes

2. **Architecture Review** (code-architecture-reviewer agent):
   - Verify adherence to project patterns and best practices
   - Check integration with existing services and APIs
   - Assess architectural fit and separation of concerns
   - Question design decisions and suggest alternatives
   - Review TypeScript strict mode and type safety
   - Validate proper error handling and edge cases

3. **Anti-Pattern Detection**:
   - Comments that state the obvious or repeat code
   - Defensive null/type checks on already-validated data
   - `as any` casts - fix the types instead
   - Unnecessary wrappers or single-use abstractions
   - Logging that exceeds file's existing pattern
   - Style inconsistent with the rest of the file

4. **Quality Assessment**:
   - Code readability and maintainability
   - Naming conventions (camelCase, PascalCase, UPPER_SNAKE_CASE)
   - Appropriate abstraction levels
   - DRY principle adherence
   - Function/class size and complexity

5. **Security & Performance**:
   - Input validation and output sanitization
   - SQL injection, XSS, and other OWASP vulnerabilities
   - Algorithmic complexity and query efficiency
   - Resource management and potential leaks
   - Caching opportunities

6. **Testing Coverage**:
   - Unit tests for new functionality
   - Edge cases and error conditions
   - Integration test requirements
   - Test clarity and maintainability

## What This Includes

This command consolidates:

- ~~`/quality:review`~~ - Comprehensive review (now here)
- ~~`/review-diff`~~ - Anti-pattern checking (now integrated)
- `code-architecture-reviewer` agent - Architecture analysis

## Review Modes

**Fast Review** (< 5 min):

- Critical issues only (security, obvious bugs)
- Breaking changes
- Test coverage basics

**Standard Review** (15-30 min):

- All quality aspects
- Performance considerations
- Documentation requirements

**Thorough Review** (1+ hour):

- Deep architectural analysis
- Design pattern evaluation
- Future maintainability
- Full security audit

## Output Format

The review is saved to `./dev/active/[task-name]/[task-name]-code-review.md` with:

```markdown
## Executive Summary
[approve / request changes / comment]

## Critical Issues (Must Fix)
- [security] Description and location
- [bug] Description and location

## Important Improvements (Should Fix)
- [performance] Description
- [quality] Description

## Minor Suggestions (Nice to Have)
- [style] Description
- [refactor] Description

## Positive Feedback
- Well-done aspects

## Architecture Considerations
- Fit within larger system
- Design decisions

## Next Steps
- Specific actions to take
```

**IMPORTANT**: The agent waits for your approval before implementing any fixes.

## Example Usage

```bash
# Review a pull request
/review 123

# Review uncommitted changes
/review

# Review specific files
/review src/components/Dashboard.tsx

# Review all changes on current branch
/review main..HEAD
```

## Review Checklist

- [ ] Functionality correct
- [ ] Edge cases handled
- [ ] No security vulnerabilities
- [ ] Performance acceptable
- [ ] Tests present and passing
- [ ] Code is maintainable
- [ ] Follows project conventions
- [ ] Documentation adequate

Remember: Good reviews are specific, constructive, and educational.
