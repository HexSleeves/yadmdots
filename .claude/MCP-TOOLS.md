# MCP Tools Reference

Model Context Protocol servers provide specialized capabilities beyond base Claude functionality.

## Available MCP Servers

### sequential-thinking

**Purpose:** Step-by-step reasoning for complex analysis
**Best For:** Multi-step problem solving, decision trees, iterative refinement

**Key Functions:**

- `sequentialthinking` - Chain of thought reasoning with revision capability

**Use Cases:**

- Five Whys analysis
- Complex debugging workflows
- Architecture decision analysis
- Step-by-step refactoring planning

**Example:**

```bash
Use sequential-thinking to analyze this authentication bug through 5 iterations
```

---

### context7

**Purpose:** Fetch up-to-date library documentation
**Best For:** Learning APIs, checking current syntax, finding examples

**Key Functions:**

- `resolve-library-id` - Find the correct library identifier
- `get-library-docs` - Fetch documentation with optional topic focus

**Use Cases:**

- "How do I use React hooks?"
- "Show me Vitest configuration options"
- "What's the current Next.js routing syntax?"

**Example:**

```bash
Use context7 to get Next.js 14 documentation on server components
```

---

### puppeteer

**Purpose:** Web automation and scraping
**Best For:** Testing web UIs, extracting web data, browser automation

**Use Cases:**

- E2E testing scenarios
- Scraping documentation
- UI interaction testing
- Screenshot generation

**Example:**

```bash
Use puppeteer to test the login flow and capture screenshots
```

---

### review-gate-v3

**Purpose:** User feedback gates during task execution
**Best For:** Getting approval, gathering input, showing progress

**Key Functions:**

- `review_gate_chat` - Open feedback popup for user review
- `review_gate_feed` - Send progress updates

**Use Cases:**

- Before making significant changes
- After completing major steps
- When user confirmation needed
- Progress reporting

**Example:**

```bash
After generating migration plan, use review-gate to get user approval
```

---

### interactive

**Purpose:** User input prompts and intensive chat sessions
**Best For:** Gathering requirements, clarifications, multi-question workflows

**Key Functions:**

- `request_user_input` - Single question prompt
- `start_intensive_chat` - Multi-question session
- `ask_intensive_chat` - Ask within session
- `stop_intensive_chat` - Close session

**Use Cases:**

- Project setup wizards
- Gathering multiple preferences
- Clarifying ambiguous requirements
- Configuration workflows

**Example:**

```bash
Use interactive to gather project requirements via intensive chat
```

---

### GitKraken

**Purpose:** Advanced git operations and PR management
**Best For:** Git workflows, PR reviews, branch management

**Key Functions:**

- `git_status`, `git_log_or_diff`, `git_branch`
- `git_checkout`, `git_add_or_commit`, `git_push`
- `pull_request_*` - PR creation and management
- `issues_*` - Issue tracking

**Use Cases:**

- Creating PRs programmatically
- Reviewing PR diffs
- Managing git worktrees
- Issue tracking

**Example:**

```bash
Use GitKraken to create PR with conventional commit format
```

---

### Clear_Thought_Server

**Purpose:** Mental models, debugging approaches, decision frameworks
**Best For:** Structured thinking, systematic analysis, framework application

**Key Functions:**

- `mentalmodel` - Apply thinking frameworks (first principles, opportunity cost, etc.)
- `debuggingapproach` - Systematic debugging methods
- `designpattern` - Software design patterns
- `collaborativereasoning` - Multi-perspective analysis
- `decisionframework` - Decision analysis tools
- `scientificmethod` - Hypothesis testing workflow

**Use Cases:**

- Root cause analysis with first principles
- Evaluating architecture trade-offs
- Systematic debugging
- Multi-stakeholder decisions
- Design pattern selection

**Example:**

```bash
Use Clear_Thought_Server mentalmodel with first_principles to analyze auth design
```

## Integration Patterns

### Commands Using MCPs

**five.md** → `sequential-thinking` for iterative Why analysis
**commit.md** → `GitKraken` for git operations
**review-prs.md** → `GitKraken` for PR fetching + `review-gate-v3` for approval

### Agents Using MCPs

**error-diagnostician** → `sequential-thinking` for systematic investigation
**tech-lead** → `Clear_Thought_Server` for decision frameworks
**implementation-investigator** → `context7` for library documentation

## When to Use MCPs

### Use MCP when

- ✅ You need specialized functionality not in base Claude
- ✅ The MCP provides structured workflow (sequential-thinking)
- ✅ You need external data (context7, puppeteer)
- ✅ You need user interaction (interactive, review-gate)
- ✅ You need specialized tooling (GitKraken)

### Don't use MCP when

- ❌ Base Claude can handle it directly
- ❌ The overhead isn't worth the benefit
- ❌ You're just delegating thinking without structure

## Configuration

MCPs are configured in `/Users/jacob.lecoq.ext/.claude/mcp.json`

To add new MCPs, update the configuration and restart Claude Code.

## Troubleshooting

**MCP not responding:** Check mcp.json syntax and server name
**Unknown function:** Verify function name matches MCP documentation
**Timeout:** Some MCPs have timeouts; check MCP-specific limits
