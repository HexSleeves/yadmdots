---
description: Apply Five Whys root cause analysis with systematic investigation
argument-hint: [issue description]
---

# Five Whys Analysis

Apply the Five Whys root cause analysis technique to investigate issues using structured reasoning.

## Description

This command implements the Five Whys problem-solving methodology with MCP-powered sequential thinking. It iteratively asks "why" to drill down from symptoms to root causes, helping identify fundamental problems rather than addressing surface-level symptoms.

## Usage

`/five [issue_description]`

## Variables

- ISSUE: The problem or symptom to analyze (default: prompt for input)
- DEPTH: Number of "why" iterations (default: 5, adjustable based on complexity)
- CONTEXT: Additional context (codebase, team, process, technical, all)

## Steps

1. **Gather Context** - Use interactive MCP to clarify the issue if needed
2. **Initial Analysis** - State the problem clearly and identify symptom vs cause
3. **Iterative Investigation** - Use sequential-thinking MCP for systematic "why" analysis
4. **Root Cause Validation** - Work backwards to verify causal chain
5. **Agent Integration** - Route to appropriate specialist:
   - Bugs → @error-diagnostician
   - Code quality → @refactoring-strategist
   - Architecture → @tech-lead
   - Data issues → @sql-data-analyst
6. **Solution Development** - Propose solutions addressing root cause
7. **Review Gate** - Present findings for user approval

## Examples

### Example 1: Application crash analysis

```text
Problem: Application crashes on startup
Why 1: Database connection fails
Why 2: Connection string is invalid
Why 3: Environment variable not set
Why 4: Deployment script missing env setup
Why 5: Documentation didn't specify env requirements
Root Cause: Missing deployment documentation
```

### Example 2: Performance issue investigation

Systematically trace why a feature is running slowly by examining each contributing factor.

## Detailed Workflow

### Phase 1: Problem Statement (interactive MCP)

If issue unclear, use `interactive.request_user_input` for clarification. Gather: What happened? When? Where? Impact? Classify: Bug, performance, design, process, or team issue.

### Phase 2: Sequential Investigation (sequential-thinking MCP)

Use `sequential-thinking` MCP with ~5-8 thoughts:

- Thought 1: State the observable problem
- Thought 2: Why did this specific symptom occur? (immediate cause)
- Thought 3: Why did that cause exist? (underlying factor)
- Thought 4: Why wasn't it prevented? (process/system gap)
- Thought 5: Why does that gap exist? (root cause)
- Thought 6+: Continue if needed or branch to explore alternatives

### Phase 3: Agent Routing

Based on root cause category:

- Code defect → `@error-diagnostician` - Investigate and provide fix strategy
- Design issue → `@refactoring-strategist` - Create refactoring plan
- Architecture → `@tech-lead` - Review decision and recommend approach
- Data/Query → `@sql-data-analyst` - Analyze query/data pattern

### Phase 4: Solution & Validation (review-gate MCP)

Present via `review-gate`: Problem statement, Five Whys chain with evidence, root cause(s), agent-provided solutions, preventive measures. Wait for user approval.

## Integration Examples

**Bug:** "App crashes on login" → sequential-thinking → root cause: null pointer → @error-diagnostician → solution + review-gate

**Performance:** "Dashboard slow" → sequential-thinking → inefficient SQL → @sql-data-analyst + @tech-lead → optimized query + caching → review-gate

## Notes

- Don't stop at symptoms; keep digging for systemic issues
- Multiple root causes may exist - explore different branches via sequential-thinking
- Document each "why" for future reference
- Consider both technical and process-related causes
- The magic isn't in exactly 5 whys - stop when you reach the true root cause
- Leverage MCP tools for structured analysis
- Route to specialist agents for domain expertise
- Always validate findings with user via review-gate
