---
description: Systematic debugging workflow with hypothesis testing and root cause analysis
argument-hint: [bug description or error message]
---

# Systematic Debugging Workflow

Debug the following issue using a systematic, hypothesis-driven approach:

**Issue:** $ARGUMENTS

## Debugging Protocol

### 1. Gather Information

- Read the error message/stack trace carefully
- Use Grep to find relevant code locations
- Use Read to examine the problematic code
- Check recent changes with `git log` and `git diff`
- Look for related issues in logs

### 2. Form Hypothesis

Use mcp__sequential-thinking__sequentialthinking to:

- Analyze the symptoms
- Identify potential root causes
- Prioritize hypotheses by likelihood
- Plan investigation steps

### 3. Systematic Investigation

Use mcp__zen__debug for structured debugging:

- Test each hypothesis methodically
- Add logging/print statements via Edit
- Run targeted tests with Bash
- Gather evidence for or against each theory
- Adjust hypotheses based on findings

### 4. Root Cause Identification

- Trace the bug to its source
- Understand WHY it occurs, not just WHAT happens
- Verify the root cause with tests
- Consider similar bugs that might exist

### 5. Fix Implementation

- Plan the fix (minimal, targeted change)
- Use Read before Edit to understand context
- Implement the fix incrementally
- Add regression tests
- Run full test suite

### 6. Validation

- Verify the fix resolves the original issue
- Test edge cases
- Check for unintended side effects
- Review the fix for code quality

## Tools to Use

- **Investigation**: Grep, Read, Glob, Bash(git log/diff)
- **Analysis**: mcp__sequential-thinking__sequentialthinking, mcp__zen__debug
- **Testing**: Bash (test runners), Glob (find tests)
- **Fixing**: Edit, Write (for new tests)
- **Validation**: Bash (run tests), mcp__zen__codereview

## Common Debugging Patterns

### For Runtime Errors

1. Examine stack trace
2. Check variable states at error point
3. Trace data flow backwards
4. Identify null/undefined/invalid values

### For Logic Bugs

1. Define expected vs actual behavior
2. Add assertions/logging
3. Step through logic flow
4. Identify faulty assumptions

### For Performance Issues

1. Profile the code
2. Identify bottlenecks
3. Analyze algorithmic complexity
4. Check for N+1 queries, memory leaks

### For Integration Issues

1. Verify API contracts
2. Check request/response formats
3. Validate environment configuration
4. Test component boundaries

## If Debugging Fails

- Use Task with subagent_type='error-diagnostician' for expert analysis
- Break the problem into smaller pieces
- Try to reproduce in isolation
- Check if it's a known issue (WebSearch)
- Pair with mcp__zen__chat for brainstorming

## Output

Provide:

1. Root cause explanation
2. The fix (code changes)
3. Tests to prevent regression
4. Any preventive measures for similar issues
