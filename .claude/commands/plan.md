---
description: Create and review implementation plans for features
argument-hint: [feature description]
---

# Plan

Create comprehensive implementation plans with expert review before coding.

**Feature:** $ARGUMENTS

## Planning Protocol

This command creates detailed plans and reviews them for issues before implementation:

### 1. Requirements Analysis

**What must it do?**

- Functional requirements
- Non-functional requirements (performance, security)
- Constraints and limitations
- Success criteria

**Who does it affect?**

- Users and their workflows
- Other systems and services
- Team members and processes

### 2. Dependencies & Integration

- What existing code/systems does this touch?
- What services need to communicate?
- What database changes are required?
- What external APIs are involved?
- What configuration is needed?

### 3. Risk Assessment

**What could go wrong?**

- Technical risks
- Integration complexities
- Performance concerns
- Security vulnerabilities
- Backward compatibility issues

**Mitigation strategies:**

- How to prevent each risk
- Fallback plans
- Rollback strategies

### 4. Implementation Stages

Break into 3-5 stages, each:

- Completable in focused work (not weeks)
- Compiles and passes tests when done
- Provides demonstrable, testable functionality
- Builds on previous stages
- Is independently mergeable

### 5. Expert Review (plan-reviewer agent)

Before implementation, the plan is reviewed for:

- Critical issues that would block implementation
- Missing considerations (error handling, testing, monitoring)
- Alternative approaches that might be better
- Compatibility issues with existing systems
- Performance and security implications
- Research findings about mentioned technologies

**The plan-reviewer agent will:**

- Deeply research all systems and technologies mentioned
- Identify dependencies, both explicit and implicit
- Assess database impacts (schema, performance, migrations)
- Suggest simpler or more maintainable alternatives
- Provide risk mitigation strategies
- Reference actual documentation and known limitations

### 6. Plan Refinement

Based on review feedback:

- Address critical issues
- Incorporate missing considerations
- Evaluate alternative approaches
- Update risk mitigation
- Refine implementation stages

## What This Includes

This command consolidates:

- ~~`/plan-feature`~~ - Feature planning (now here)
- `plan-reviewer` agent - Expert plan review

## Stage Design Rules

Each stage must:

- Have a clear, testable goal
- Include specific work items
- Define "done when" criteria
- Be independently testable
- Be safe to merge on its own

## Output Format

```markdown
## Requirements
- [Functional requirement 1]
- [Functional requirement 2]
- Constraints: [limitations]

## Dependencies
- [Existing code/systems affected]
- [External services/APIs]
- [Database changes needed]

## Risks & Mitigation
- [Risk 1]: Mitigation: [approach]
- [Risk 2]: Mitigation: [approach]

## Implementation Stages

### Stage 1: [Name]
- Goal: [What this achieves]
- Tasks: [Specific work items]
- Done when: [Testable criteria]

### Stage 2: [Name]
...

## Review Findings
[From plan-reviewer agent]

### Critical Issues
[Must address before starting]

### Missing Considerations
[Important aspects not covered]

### Alternative Approaches
[Better or simpler options]

### Research Findings
[Key discoveries about technologies/systems]
```

## When to Use

- **New features**: Adding meaningful functionality
- **Major changes**: Refactoring, migrations, architectural changes
- **Uncertain tasks**: When you're not sure of the best approach
- **Complex integrations**: Multiple systems working together
- **High-risk work**: Security, performance, data migrations

## When to Skip

- **Trivial changes**: Simple bug fixes, typos, small tweaks
- **Well-understood patterns**: Following existing examples
- **Urgent hotfixes**: Critical production issues (plan after fixing)

## Example Usage

```bash
# New feature
/plan "Add user authentication with JWT tokens"

# Major refactoring
/plan "Migrate from Redux to TanStack Query for server state"

# System integration
/plan "Integrate Stripe payment processing"

# Performance improvement
/plan "Add caching layer to reduce database load"

# Infrastructure change
/plan "Migrate from REST to GraphQL API"
```

## Success Criteria

A good plan:

- Breaks work into logical, testable stages
- Identifies and mitigates risks
- Considers all dependencies and integrations
- Has been reviewed by expert agent
- Gets team/user approval before implementation
- Provides clear path from current to desired state

Remember: Hours of planning save days of rework.
