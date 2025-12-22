---
description: Systematic debugging with root cause analysis and Five Whys
argument-hint: [bug description or error message]
---

# Debug

Systematic debugging workflow with hypothesis testing and root cause analysis.

**Issue:** $ARGUMENTS

## Debugging Protocol

This command uses a comprehensive approach to find and fix bugs:

### 1. Gather Information

- Read error messages and stack traces carefully
- Use Grep to find relevant code locations
- Use Read to examine problematic code
- Check recent changes with `git log` and `git diff`
- Look for related issues in logs and documentation

### 2. Root Cause Analysis (Five Whys)

Apply the Five Whys methodology to dig deeper:

```
Problem: [Observable symptom]
Why 1: [Immediate cause]
Why 2: [Underlying factor]
Why 3: [Why wasn't it prevented?]
Why 4: [Why does that gap exist?]
Why 5: [Fundamental root cause]
```

**Don't stop at symptoms** - keep asking "why" until you reach the systemic issue.

### 3. Form Hypotheses

Use mcp__sequential-thinking__sequentialthinking to:

- Analyze symptoms from multiple angles
- Identify 3-5 potential root causes
- Prioritize hypotheses by likelihood
- Plan investigation steps for each

### 4. Systematic Investigation

Use mcp__zen__debug for structured testing:

- Test each hypothesis methodically
- Add logging/print statements via Edit
- Run targeted tests with Bash
- Gather evidence for or against each theory
- Adjust hypotheses based on findings

### 5. Root Cause Identification

- Trace the bug to its source
- Understand WHY it occurs, not just WHAT happens
- Verify the root cause with tests
- Consider similar bugs that might exist elsewhere

### 6. Fix Implementation

- Plan the fix (minimal, targeted change)
- Use Read before Edit to understand context
- Implement the fix incrementally
- Add regression tests
- Run full test suite

### 7. Validation

- Verify the fix resolves the original issue
- Test edge cases
- Check for unintended side effects
- Review the fix for code quality

## Debugging Patterns by Type

### Runtime Errors

1. Examine stack trace
2. Check variable states at error point
3. Trace data flow backwards
4. Identify null/undefined/invalid values

### Logic Bugs

1. Define expected vs actual behavior
2. Add assertions/logging
3. Step through logic flow
4. Identify faulty assumptions

### Performance Issues

1. Profile the code
2. Identify bottlenecks
3. Analyze algorithmic complexity
4. Check for N+1 queries, memory leaks

### Integration Issues

1. Verify API contracts
2. Check request/response formats
3. Validate environment configuration
4. Test component boundaries

## What This Includes

This command consolidates:

- ~~`/testing:debug`~~ - Systematic debugging (now here)
- ~~`/analyze-bug`~~ - Root cause analysis (now integrated)
- ~~`/research:five`~~ - Five Whys methodology (now integrated)

## Tools Available

- **Investigation**: Grep, Read, Glob, Bash(git log/diff)
- **Analysis**: mcp__sequential-thinking__sequentialthinking, mcp__zen__debug
- **Testing**: Bash (test runners), Glob (find tests)
- **Fixing**: Edit, Write (for new tests)
- **Validation**: Bash (run tests), mcp__zen__codereview

## If Debugging Fails

- Use Task with `subagent_type='error-diagnostician'` for expert analysis
- Try `auto-error-resolver` agent for TypeScript compilation errors
- Try `frontend-error-fixer` agent for frontend build/runtime errors
- Break the problem into smaller pieces
- Try to reproduce in isolation
- Check if it's a known issue (WebSearch)
- Use mcp__zen__chat for brainstorming

## Output

Provides:

1. Root cause explanation (with Five Whys chain)
2. The fix (code changes)
3. Tests to prevent regression
4. Preventive measures for similar issues
5. Documentation of what was learned

## Example Usage

```bash
# Debug a specific error
/debug "TypeError: Cannot read property 'name' of undefined"

# Debug application behavior
/debug "Login form not submitting on Enter key"

# Debug performance issue
/debug "Dashboard loads slowly with 100+ items"

# Debug integration issue
/debug "API returns 500 when creating new user"
```

## Success Criteria

- Root cause identified (not just symptom)
- Fix addresses the fundamental issue
- Tests prevent regression
- Similar bugs proactively fixed
- Knowledge documented for team

Remember: The best debugging finds not just the bug, but the system that allowed it.
