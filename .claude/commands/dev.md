---
description: Full development workflow - explore, plan, code, test
argument-hint: [feature or task description]
---

# Dev

Complete development workflow combining exploration, planning, implementation, and testing.

**Task:** $ARGUMENTS

## Development Workflow

**CRITICAL: You are in autonomous development mode. You MUST iterate and continue until the task is completely resolved.**

### 1. Explore

**Find and understand all relevant code:**

- Use parallel agents to discover related files
- Read files that may be useful as examples or edit targets
- Map out system dependencies and interactions
- Understand existing patterns and conventions
- Identify all affected components

**Research extensively:**

- Use WebSearch/WebFetch for current documentation
- Use mcp__zen__apilookup for API documentation
- Check for known issues and solutions
- Find best practices and examples

### 2. Plan

**Create detailed implementation plan:**

**Tests:** Description of tests you will write (unit, integration, etc.)

**Implementation:** Step-by-step approach including:

- Files to create or modify
- Components to build or update
- API endpoints to add
- Database changes required
- Configuration updates needed

**Documentation:** What needs to be written or updated

**Use parallel agents for research if uncertain** about:

- Technology choices
- API usage patterns
- Best practices
- Integration approaches

**If still unclear, pause and ask the user**

### 3. Code

**Implement following the plan:**

- Write code matching existing codebase style
- Follow established patterns and conventions
- Add proper error handling
- Include TypeScript types
- Write self-documenting code with minimal comments
- Run auto-formatting when done
- Fix any reasonable linter warnings

### 4. Test

**Comprehensive testing:**

- **Run all automated tests** using parallel agents
- **Verify tests pass** for affected components
- **Manual testing** if changes affect UI (use browser tools)
- **Create testing checklist** and verify each item
- **Fix any failures** discovered during testing

**If testing reveals problems:**

- Return to planning stage
- Create new plan to address issues
- Re-implement and re-test
- Continue until all tests pass

### 5. Report

**Provide implementation summary:**

```markdown
## What Was Done
- [Summary of implementation]

## Choices Made
- [Decision 1]: Rationale: [why]
- [Decision 2]: Rationale: [why]

## Testing Performed
- [Test type 1]: Results
- [Test type 2]: Results

## Useful Commands
```bash
# Commands for future developers
npm test -- ComponentName
npm run build
```

```

## What This Includes

This command consolidates:
- ~~`/dev:beast`~~ - Autonomous problem-solving (now here)
- ~~`/dev:explore-plan-code-test`~~ - Structured workflow (now integrated)

## Beast Mode Requirements

1. **Autonomous Execution**: Solve completely before returning control
2. **Extensive Research**: Use WebSearch/WebFetch for up-to-date info
3. **TodoWrite Required**: Create and maintain detailed todo list
4. **Test Rigorously**: Run tests multiple times, check edge cases
5. **Actually Execute**: When you say "I will do X", immediately do X
6. **Never End Prematurely**: Complete ALL todo items before yielding

## Workflow Principles

- **ACTUALLY MAKE TOOL CALLS** - When you say "I will X", immediately do X
- **READ BEFORE EDITING** - Always Read files before using Edit
- **RESEARCH LIBRARIES** - Never assume API knowledge is current
- **MARK COMPLETE** - Update TodoWrite immediately after each step
- **TEST EDGE CASES** - Run tests multiple times with different scenarios
- **CHECK .ENV** - Proactively create .env files when needed
- **NO PREMATURE ENDING** - Complete the entire todo list

## If You Get Stuck

1. Use mcp__sequential-thinking__sequentialthinking to break down the problem
2. Use mcp__zen__debug for systematic debugging
3. Use Task with appropriate specialist agent
4. Research more - fetch documentation, check GitHub issues

## Resume Protocol

If user says "continue", "resume", or "try again":
1. Check previous todo list for incomplete items
2. State which step you're resuming from
3. Continue until ALL items are complete

## Tools Priority

- **Research**: WebSearch, WebFetch, mcp__zen__apilookup
- **Investigation**: Glob, Grep, Read, Task(subagent_type='Explore')
- **Planning**: TodoWrite, mcp__sequential-thinking__sequentialthinking
- **Implementation**: Edit, Write, Read
- **Testing**: Bash, Glob (for test files)
- **Debugging**: mcp__zen__debug, Grep, Bash

## Example Usage

```bash
# Implement new feature
/dev "Add dark mode toggle to user settings"

# Fix complex bug
/dev "Fix race condition in order processing"

# Build complete component
/dev "Create user profile page with edit functionality"

# Integrate service
/dev "Add Stripe payment processing to checkout"
```

## Success Criteria

- Task is completely implemented
- All tests pass
- Code follows project conventions
- Documentation is updated
- Edge cases are handled
- Solution is tested and verified

Remember: You are in Beast Mode. Go deep, be thorough, complete the mission. 🦁
