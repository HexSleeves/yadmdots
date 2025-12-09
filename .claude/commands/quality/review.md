---
description: Perform comprehensive code review with quality, security, and performance analysis
argument-hint: [files or PR number]
---

# Code Review

Perform comprehensive code review for: $ARGUMENTS

## Review Protocol

### 1. Identify Scope

**For PR Review:**
- Use `gh pr view <number>` to get PR details
- Use `gh pr diff <number>` to see changes
- Read all modified files with Read

**For File Review:**
- Use Glob to find related files
- Use Read to examine the code
- Use Grep to find usages and dependencies

### 2. Systematic Review with mcp__zen__codereview

Use mcp__zen__codereview for comprehensive analysis covering:

**Code Quality:**
- Readability and maintainability
- Naming conventions
- Code organization and structure
- DRY principle adherence
- Appropriate abstraction levels

**Security:**
- Input validation
- SQL injection vulnerabilities
- XSS vulnerabilities
- CSRF protection
- Authentication/authorization
- Secrets in code
- Dependency vulnerabilities

**Performance:**
- Algorithmic complexity
- Database query efficiency
- Memory usage
- Network calls optimization
- Caching opportunities
- Resource leaks

**Architecture:**
- Design pattern appropriateness
- SOLID principles
- Separation of concerns
- Dependency management
- API design
- Error handling strategy

### 3. Language-Specific Review

**Go:**
- Error handling (don't ignore errors)
- Goroutine leaks
- Proper context usage
- Interface design
- Race conditions

**Rust:**
- Ownership and borrowing
- Proper error handling (Result/Option)
- Unsafe code justification
- Lifetime annotations
- Clone vs reference

**TypeScript/JavaScript:**
- Type safety (avoid `any`)
- Null/undefined handling
- Async/await patterns
- React hooks rules
- Bundle size impact

**Python:**
- Type hints usage
- Exception handling
- List comprehension vs loops
- Context managers
- GIL considerations

**Java:**
- Exception handling
- Resource management (try-with-resources)
- Null safety
- Stream API usage
- Thread safety

### 4. Testing Review

Check for:
- [ ] Unit tests for new functionality
- [ ] Edge cases covered
- [ ] Error conditions tested
- [ ] Integration tests where needed
- [ ] Test clarity and maintainability
- [ ] No flaky tests
- [ ] Appropriate mocking

### 5. Documentation Review

Verify:
- [ ] Public APIs documented
- [ ] Complex logic explained
- [ ] README updated if needed
- [ ] Migration guide for breaking changes
- [ ] Inline comments for non-obvious code
- [ ] API documentation current

### 6. Git History Review

Use Bash to check:
```bash
git log --oneline <branch>           # Review commit messages
git log --stat <branch>              # Check file change distribution
git diff <base>..<branch> --stat     # See change summary
```

**Good Commits:**
- Meaningful commit messages
- Logical grouping of changes
- No "fix typo" or "WIP" commits
- No merge commits (rebased)

### 7. Generate Review Comments

Provide feedback in this format:

```markdown
## Critical Issues (Must Fix)
- [security] SQL injection vulnerability in user_query.go:45
- [bug] Potential null pointer dereference in auth.ts:123

## High Priority (Should Fix)
- [performance] N+1 query in getUserOrders (orders.py:67)
- [quality] Function too complex, consider extracting (service.rs:234)

## Medium Priority (Consider Fixing)
- [quality] Inconsistent naming: userId vs user_id
- [docs] Missing docstring for public API

## Low Priority (Suggestions)
- [style] Consider using const instead of let
- [refactor] Opportunity to reduce duplication

## Positive Feedback
- Good test coverage
- Clear error messages
- Well-structured code
```

### 8. Review Modes

**Fast Review** (< 5 min):
- Focus on critical issues only
- Security and obvious bugs
- Breaking changes
- Test coverage

**Standard Review** (15-30 min):
- All quality aspects
- Performance considerations
- Documentation
- Test quality

**Thorough Review** (1+ hour):
- Deep architectural analysis
- Design pattern evaluation
- Future maintainability
- Performance benchmarking
- Security audit

## Review Checklist

### Functionality
- [ ] Code does what it's supposed to
- [ ] Edge cases handled
- [ ] Error conditions managed
- [ ] No obvious bugs

### Quality
- [ ] Readable and maintainable
- [ ] Follows project conventions
- [ ] Appropriate abstraction level
- [ ] No code smells

### Security
- [ ] No security vulnerabilities
- [ ] Input validated
- [ ] Output sanitized
- [ ] Secrets not hardcoded

### Performance
- [ ] No obvious performance issues
- [ ] Appropriate data structures
- [ ] Efficient algorithms
- [ ] Resource management

### Testing
- [ ] Tests present and passing
- [ ] Edge cases covered
- [ ] Test quality acceptable

### Documentation
- [ ] Code is self-documenting or commented
- [ ] Public APIs documented
- [ ] README updated if needed

## Tools to Use

- **Code Review**: mcp__zen__codereview
- **File Reading**: Read, Grep, Glob
- **Git Analysis**: Bash(git:*), Bash(gh:*)
- **Security**: WebSearch for CVEs, Grep for secrets
- **Performance**: Look for patterns, use WebSearch for benchmarks

## Output Format

Provide:
1. Executive summary (approve, request changes, comment)
2. Categorized issues (critical, high, medium, low)
3. Positive feedback
4. Overall assessment
5. Suggested next steps

**Remember: Good reviews are specific, constructive, and educational.**
