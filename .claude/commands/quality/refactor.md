---
description: Systematic refactoring workflow with analysis and validation
argument-hint: [file or component to refactor]
---

# Refactoring Workflow

Refactor the following code with systematic analysis: $ARGUMENTS

## Refactoring Protocol

### 1. Understand Current State

- Use Read to examine the code thoroughly
- Understand the business logic and intent
- Identify all dependencies and usages with Grep
- Check existing tests with Glob
- Review git history for context: `git log --follow <file>`

### 2. Identify Refactoring Opportunities

Use mcp__zen__refactor for systematic analysis:

**Code Smells to Find:**

- Long functions/classes
- Duplicate code
- Complex conditionals
- Large parameter lists
- Feature envy
- Data clumps
- Primitive obsession

**Improvement Categories:**

- Decomposition (break down large units)
- Modernization (update to current patterns)
- Organization (improve structure)
- Performance (optimize hot paths)

### 3. Research Best Practices

- Use WebSearch for current refactoring patterns
- Use mcp__context7__get-library-docs for framework-specific patterns
- Check similar code in the codebase with Grep
- Review language-specific idioms

### 4. Plan the Refactoring

Use TodoWrite to create a detailed plan:

- Break down into small, safe steps
- Identify which tests need updating
- Note any new tests required
- Plan for backwards compatibility if needed
- Consider performance implications

### 5. Execute Incrementally

**For Each Refactoring Step:**

1. Make ONE change at a time
2. Run tests immediately with Bash
3. Commit if tests pass (wait for user approval)
4. If tests fail, revert and adjust approach

**Refactoring Techniques:**

- Extract Method/Function
- Extract Class/Module
- Rename for Clarity
- Introduce Parameter Object
- Replace Conditional with Polymorphism
- Consolidate Duplicate Code

### 6. Validate Quality

Use mcp__zen__codereview to verify:

- Code is more maintainable
- No functionality changed (unless intended)
- Tests still pass
- Performance not degraded
- No new security issues

## Language-Specific Patterns

### Go

- Extract interfaces for testability
- Use functional options pattern
- Leverage struct embedding
- Apply table-driven patterns

### Rust

- Use type system for safety
- Apply builder pattern
- Leverage trait composition
- Use Result/Option idiomatically

### Java

- Apply SOLID principles
- Use streams for collections
- Leverage Optional
- Consider design patterns (Strategy, Factory, etc.)

### TypeScript/JavaScript

- Extract custom hooks (React)
- Use composition over inheritance
- Apply functional patterns
- Leverage TypeScript's type system

### Python

- Use dataclasses/pydantic
- Apply list comprehensions appropriately
- Leverage context managers
- Use type hints

## Refactoring Safety Checklist

- [ ] All tests pass before starting
- [ ] Changes made incrementally
- [ ] Tests run after each change
- [ ] Test coverage maintained or improved
- [ ] No breaking changes (or documented)
- [ ] Performance benchmarks pass
- [ ] Code review completed
- [ ] Documentation updated

## Tools to Use

- **Analysis**: mcp__zen__refactor, mcp__zen__analyze, Grep, Read
- **Research**: WebSearch, mcp__context7__get-library-docs
- **Planning**: TodoWrite, mcp__sequential-thinking__sequentialthinking
- **Implementation**: Edit, Write
- **Testing**: Bash (test runners), Glob (find tests)
- **Validation**: mcp__zen__codereview, Bash (linters)

## When to Stop

Refactoring is complete when:

1. Code is significantly more readable/maintainable
2. All tests pass
3. No obvious further improvements
4. Diminishing returns on effort

**Remember: Perfect is the enemy of good. Refactor to "good enough" not "perfect".**

## Output

Provide:

1. Summary of changes made
2. Before/after comparison of key metrics (lines of code, complexity, etc.)
3. Updated tests
4. Any breaking changes or migration notes
