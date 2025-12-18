# AI Assistant Configuration

Configuration files for Claude Code and Cursor AI assistants.

## Folder Structure

```
ai/
├── claude/              # Claude Code configuration
│   ├── CLAUDE.md        # Core principles (copy to .claude/)
│   ├── agent_docs/      # Detailed reference docs
│   ├── commands/        # Slash commands
│   └── skills/          # Auto-activated skills
└── cursor/              # Cursor configuration
    ├── AGENTS.md        # Agent instructions
    ├── rules/           # .mdc rule files
    ├── prompts/         # Slash commands
    └── USER-RULES.txt   # Global user rules
```

## Setup

### Claude Code

```bash
cd /your/project
cp -r /path/to/dotfiles/ai/claude .claude

# Rename commands with cust- prefix for easy discovery
cd .claude/commands
for f in *.md; do mv "$f" "cust-$f"; done
```

### Cursor

```bash
cd /your/project
cp -r /path/to/dotfiles/ai/cursor .cursor
```

Also paste `USER-RULES.txt` content into Cursor Settings → Rules (one-time).

### Both Tools Together

In Cursor Settings → Rules:
- Enable "Include CLAUDE.md in context"
- Enable "Import Claude Commands"

This lets Cursor share the same config files as Claude Code.

## Commands

| Command | Description |
|---------|-------------|
| `/fix-types` | Fix TypeScript errors without using `any` |
| `/review-diff` | Review branch for AI-generated anti-patterns |
| `/simplify` | Simplify code while keeping behavior identical |
| `/analyze-bug` | Systematic root cause analysis |
| `/plan-feature` | Break complex features into stages |
| `/take-notes` | Capture technical discoveries |

## Rules/Skills

| Topic | Description |
|-------|-------------|
| Coding Guidelines | Core patterns: simplicity, early returns, error handling |
| TypeScript Patterns | Type inference, assertions, interfaces, casting |
| Serverless AWS | Lambda handlers, secrets caching, SQS, cold starts |
| Code Review | Remove AI slop: excessive comments, defensive checks, `as any` |

## Coding Philosophy

- Simplicity over cleverness
- Functions under 20 lines, single responsibility
- Early returns over nested conditionals
- Type guards over `any` casts
- Match existing file patterns
