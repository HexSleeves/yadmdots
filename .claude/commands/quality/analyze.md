---
description: Comprehensive codebase and architecture analysis
argument-hint: [component or aspect to analyze]
---

# Codebase Analysis

Perform comprehensive analysis of: $ARGUMENTS

## Analysis Protocol

### 1. Define Scope

Determine what to analyze:
- **Component**: Specific module, service, or package
- **Feature**: User-facing functionality and its implementation
- **Architecture**: Overall system design and patterns
- **Performance**: Bottlenecks and optimization opportunities
- **Security**: Vulnerabilities and security posture
- **Quality**: Code health and maintainability

### 2. Systematic Analysis with mcp__zen__analyze

Use mcp__zen__analyze for structured investigation with analysis_type:

**Architecture Analysis** (`analysis_type='architecture'`):
- System design and structure
- Component relationships and dependencies
- Design patterns used
- Separation of concerns
- API design
- Data flow

**Performance Analysis** (`analysis_type='performance'`):
- Algorithmic complexity
- Database query patterns
- Caching strategies
- Resource utilization
- Scalability concerns
- Bottleneck identification

**Security Analysis** (`analysis_type='security'`):
- Authentication/authorization flows
- Input validation
- Output encoding
- Secrets management
- Dependency vulnerabilities
- Attack surface

**Quality Analysis** (`analysis_type='quality'`):
- Code organization
- Test coverage
- Technical debt
- Code smells
- Maintainability metrics
- Documentation quality

**General Analysis** (`analysis_type='general'`):
- Comprehensive overview
- All aspects above
- Technology stack assessment
- Best practices adherence

### 3. Exploration Strategy

**Map the Territory:**
1. Use Glob to discover project structure:
   ```
   **/*.go
   **/*.rs
   **/*.ts
   **/*_test.* or **/*.test.*
   **/README.md
   **/docker-compose.yml
   ```

2. Read key files:
   - README.md, package.json, Cargo.toml, go.mod
   - Main entry points
   - Configuration files
   - Important interfaces/types

3. Use Grep to understand patterns:
   - Find all uses of key abstractions
   - Locate error handling patterns
   - Identify database access patterns
   - Discover API endpoints

**Use Task for Deep Exploration:**
- Task(subagent_type='Explore') for "how does X work" questions
- Task(subagent_type='implementation-investigator') for technology integration analysis

### 4. Technology Stack Assessment

**Identify and Document:**
- Programming languages and versions
- Frameworks and major libraries
- Database systems
- Infrastructure components
- Build and deployment tools
- Testing frameworks

**Research Current State:**
- Use mcp__zen__apilookup for version info
- Check for deprecated dependencies with WebSearch
- Identify security vulnerabilities
- Note upgrade paths

### 5. Architecture Mapping

**Create Mental Model:**
```
┌─────────────┐     ┌──────────────┐     ┌──────────┐
│   Frontend  │────▶│   API Layer  │────▶│ Database │
└─────────────┘     └──────────────┘     └──────────┘
                           │
                           ▼
                    ┌──────────────┐
                    │ External APIs│
                    └──────────────┘
```

**Document:**
- Layer separation
- Data flow
- Communication patterns
- Dependency graph
- Critical paths
- Scalability bottlenecks

### 6. Metrics Collection

Use Bash to gather metrics:

**Code Metrics:**
```bash
# Lines of code by language
fd -e go -x wc -l | awk '{sum+=$1} END {print sum}'
fd -e ts -x wc -l | awk '{sum+=$1} END {print sum}'

# File counts
fd -e go | wc -l
fd -e test.go | wc -l

# Complexity (if tools available)
gocyclo .
```

**Git Metrics:**
```bash
# Most changed files (churn)
git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -20

# Contributors
git shortlog -sn

# Commit frequency
git log --pretty=format:"%ad" --date=short | uniq -c
```

**Dependency Analysis:**
```bash
# Go
go mod graph

# Node.js
npm ls --depth=0

# Rust
cargo tree --depth=1

# Python
pip list
```

### 7. Pattern Recognition

Identify common patterns:
- **Design Patterns**: Factory, Strategy, Observer, etc.
- **Architectural Patterns**: MVC, Hexagonal, Clean Architecture
- **Data Patterns**: Repository, DAO, Active Record
- **Error Handling**: Result types, exceptions, error codes
- **Concurrency**: Goroutines, async/await, threads

### 8. Quality Assessment

**Code Quality:**
- Naming conventions consistency
- Function/class size distribution
- Cyclomatic complexity
- Code duplication
- Test coverage

**Technical Debt:**
- TODO/FIXME comments
- Deprecated API usage
- Outdated dependencies
- Missing tests
- Documentation gaps

### 9. Generate Comprehensive Report

Structure the analysis:

```markdown
# Analysis Report: <Component/System>

## Executive Summary
- Overall assessment (1-2 paragraphs)
- Key findings
- Priority recommendations

## Architecture Overview
- High-level design
- Component diagram
- Technology stack
- Design patterns

## Detailed Analysis
### Strengths
- What's working well
- Good patterns observed
- Quality highlights

### Concerns
- Issues identified
- Technical debt
- Performance bottlenecks
- Security risks

### Opportunities
- Improvement areas
- Modernization potential
- Optimization opportunities

## Metrics
- Code metrics
- Test coverage
- Performance benchmarks
- Dependency health

## Recommendations
### High Priority
- Critical issues to address

### Medium Priority
- Important improvements

### Low Priority
- Nice-to-have enhancements

## Action Items
- [ ] Concrete next steps
- [ ] Estimated effort
- [ ] Expected impact
```

## Analysis Modes

**Quick Assessment** (5-10 min):
- High-level architecture
- Technology stack
- Major patterns
- Critical issues

**Standard Analysis** (30-60 min):
- Comprehensive architecture review
- Quality assessment
- Performance evaluation
- Security review

**Deep Dive** (2+ hours):
- Detailed component analysis
- Performance profiling
- Security audit
- Refactoring roadmap

## Tools to Use

- **Analysis**: mcp__zen__analyze, Task(subagent_type='Explore')
- **Code Exploration**: Read, Glob, Grep
- **Metrics**: Bash (git, language tools)
- **Research**: WebSearch, mcp__zen__apilookup
- **Specialist**: Task(subagent_type='tech-lead' or 'implementation-investigator')

## Output

Provide:
1. Executive summary
2. Architecture overview with diagrams
3. Detailed findings by category
4. Metrics and measurements
5. Prioritized recommendations
6. Actionable next steps

**Remember: Good analysis identifies both strengths and weaknesses, with actionable recommendations.**
