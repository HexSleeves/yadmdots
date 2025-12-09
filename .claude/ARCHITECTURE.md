# Claude Code Architecture

This document explains the design philosophy and mental model for your Claude Code setup.

## Design Philosophy

**Principle:** Choose the simplest approach that solves the problem effectively.

The setup provides multiple tools at different abstraction levels. Always start simple and escalate to more complex approaches only when needed.

## Architecture Layers

```mermaid
┌─────────────────────────────────────────┐
│            User Intent                   │
└─────────────────┬───────────────────────┘
                  │
      ┌───────────┼───────────┐
      ▼           ▼           ▼
┌──────────┐ ┌─────────┐ ┌─────────┐
│ Commands │ │ Agents  │ │  Direct │
└────┬─────┘ └────┬────┘ └────┬────┘
     │            │            │
     └──────┬─────┴────────────┘
            ▼
     ┌─────────────┐
     │  MCP Tools  │
     └──────┬──────┘
            ▼
     ┌─────────────┐
     │  Claude AI  │
     └─────────────┘
```

## Component Responsibilities

### 1. MCP Tools (Foundation Layer)

**What:** Model Context Protocol servers providing specialized capabilities
**When:** Automatically available, called by name when needed

**Available:**

- `sequential-thinking` - Step-by-step reasoning for complex analysis
- `context7` - Library documentation lookup
- `puppeteer` - Web automation and scraping
- `review-gate-v3` - User feedback gates
- `interactive` - User input prompts
- `GitKraken` - Advanced git operations
- `Clear_Thought_Server` - Mental models and frameworks

**Use when:** You need specialized functionality not available in base Claude

### 2. Agents (Specialist Layer)

**What:** Focused AI personalities with domain expertise
**When:** You need expert perspective on specific domains

**Available:**

- `error-diagnostician` - Bug investigation and resolution
- `code-reviewer` - PR and code quality review
- `refactoring-strategist` - Code improvement planning
- `tech-lead` - Architectural decisions and mentorship
- `sql-data-analyst` - Data analysis and SQL optimization
- `implementation-investigator` - Technology integration analysis
- `ui-design-expert` - UI/UX and Tailwind CSS

**Use when:** You need specialized domain knowledge or perspective

### 3. Commands (Workflow Layer)

**What:** Pre-defined workflows for common development tasks
**When:** You have a known, repeatable workflow

**Categories:**

- **Coding:** bug-fix, refactor, explore-plan-code-test
- **Git:** commit, worktree
- **Review:** review-prs
- **Analysis:** five (Five Whys), spec, steering
- **Meta:** ccusage-daily

**Use when:** You want a structured, step-by-step process

### 4. Direct Interaction

**What:** Conversational interaction with base Claude
**When:** For simple tasks, exploration, or unique situations

**Use when:** The task doesn't fit other categories or is straightforward

## Decision Framework

### Simple Task (< 5 min, single file, clear path)

→ **Direct Interaction**

```bash
Example: "Add a comment to this function explaining the algorithm"
```

### Known Workflow (repeatable process)

→ **Command**

```bash
Example: /commit → Analyzes changes and creates conventional commit
```

### Domain Expertise Needed

→ **Agent**

```bash
Example: @tech-lead "Should we use microservices or monolith?"
```

### Specialized Tool Needed

→ **MCP Tool**

```bash
Example: Use sequential-thinking for complex step-by-step analysis
```

### Complex Multi-Aspect Task

→ **Combination**

```bash
Example: /spec (command) → creates tasks → assigns to agents → uses MCP tools
```

## Anti-Patterns to Avoid

### ❌ Over-Engineering

**Bad:** Using agents to spawn more agents for simple file reads
**Good:** Read the file directly

### ❌ Wrong Abstraction Level

**Bad:** Using a command for a one-off unique task
**Good:** Use direct interaction for unique situations

### ❌ Ignoring Available Tools

**Bad:** Manually implementing Five Whys when sequential-thinking MCP exists
**Good:** Leverage existing MCP tools

### ❌ Premature Parallelization

**Bad:** Spawning 10 sub-tasks for analyzing 3 files
**Good:** Read 3 files in parallel directly

## Best Practices

### ✅ Start Simple

Begin with the simplest approach. Escalate if needed.

### ✅ Compose Tools

Commands can use agents. Agents can use MCP tools. Combine freely.

### ✅ Clear Boundaries

Each component has a clear responsibility. Don't make agents do command work.

### ✅ Measurable Benefit

Use complex approaches only when they provide clear value over simple ones.

## Integration Patterns

### Pattern 1: Command → Agent

```bash
/review-prs → Uses @code-reviewer agent for each PR
```

### Pattern 2: Agent → MCP

```bash
@error-diagnostician → Uses sequential-thinking for root cause analysis
```

### Pattern 3: Command → MCP → Agent

```bash
/five → Uses sequential-thinking MCP → Calls @error-diagnostician for bugs
```

### Pattern 4: Direct → Multiple Agents (Parallel)

```bash
User: "Analyze auth system"
Claude: Launches @security-expert, @code-reviewer, @tech-lead in parallel
```

## Evolution Guidelines

### Adding New Components

**New Agent:** Create when you repeatedly need the same domain expertise
**New Command:** Create when you run the same workflow 3+ times
**New MCP:** Use existing MCPs first; create only for truly new capabilities
**New Hook:** Create for validation that should always run

### Removing Components

**Agent:** Remove if overlaps with marketplace agent or rarely used
**Command:** Remove if workflow changes or superseded
**MCP:** Remove if unused for 3 months

## File Organization

```bash
.claude/
├── ARCHITECTURE.md          ← This file
├── CLAUDE.md               ← Core principles (concise)
├── STANDARDS.md            ← Code standards by language
├── WORKFLOWS.md            ← Development workflows
├── MCP-TOOLS.md            ← MCP server reference
├── mcp.json                ← MCP configuration
├── agents/                 ← Domain expert agents
├── commands/               ← Reusable workflows
└── hooks/                  ← Validation hooks
```

## Quick Reference

**Need to analyze?** → Sequential-thinking MCP or Direct
**Need domain expertise?** → Specific Agent
**Have a workflow?** → Relevant Command
**Simple task?** → Direct interaction
**Not sure?** → Start simple, escalate if needed
