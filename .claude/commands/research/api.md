---
description: Research library/API documentation with comprehensive web fetching
argument-hint: [library or API name]
---

# API Research

Research comprehensive documentation for: $ARGUMENTS

## Research Protocol

### 1. Initial Discovery

Use multiple approaches in parallel:

**Context7 (Preferred for popular libraries):**

1. Use mcp__context7__resolve-library-id to find the library
2. Use mcp__context7__get-library-docs with mode='code' for API reference
3. Use mcp__context7__get-library-docs with mode='info' for guides

**Direct Documentation:**

- Use mcp__zen__apilookup for current API/SDK documentation
- Handles version info, breaking changes, migration guides

**Web Search:**

- Use WebSearch to find official documentation
- Look for: official docs, GitHub repo, npm/crates.io/pkg.go.dev
- Check for: API reference, getting started guides, examples

### 2. Comprehensive Fetching

For each relevant URL found:

1. **Official Documentation**
   - Use WebFetch to retrieve main documentation pages
   - Follow links to API reference, guides, examples
   - Recursively fetch important sub-pages

2. **GitHub Repository**
   - Fetch README.md
   - Check examples/ directory
   - Review CHANGELOG for breaking changes
   - Look at issues for common problems

3. **Package Registry**
   - npm: <https://npmjs.com/package/><name>
   - crates.io: <https://crates.io/crates/><name>
   - pkg.go.dev: <https://pkg.go.dev/><module>
   - PyPI: <https://pypi.org/project/><name>
   - Maven Central: <https://search.maven.org>

### 3. Version-Specific Research

**Critical Version Info:**

- Current stable version
- Breaking changes in recent versions
- Migration guides from older versions
- Deprecation warnings
- Security advisories

**How to Check:**

- Package manager: `npm info`, `cargo search`, `go list -m`
- Release notes on GitHub
- CHANGELOG.md
- Migration guides in docs

### 4. Usage Patterns

Research and document:

**Installation:**

- Package manager command
- Required dependencies
- Configuration steps

**Basic Usage:**

- Imports/requires
- Initialization
- Common patterns
- Code examples

**Advanced Features:**

- Configuration options
- Plugins/extensions
- Performance optimization
- Best practices

**Integration:**

- Framework-specific guides (Next.js, React, etc.)
- Common use cases
- Gotchas and pitfalls

### 5. Collect Examples

Find real-world examples:

- Official examples in repo
- Blog posts and tutorials
- Stack Overflow solutions
- GitHub search for usage: `https://github.com/search?q=<library>&type=code`

### 6. Synthesize Information

Create a comprehensive summary:

```markdown
# <Library Name> - Research Summary

## Overview
- Purpose and main features
- Current version
- License and maintainer

## Installation
- Commands for each package manager
- Required dependencies
- Configuration

## Quick Start
- Minimal working example
- Common setup patterns

## API Reference
- Key classes/functions
- Common methods
- Configuration options

## Best Practices
- Recommended patterns
- Performance tips
- Security considerations

## Common Issues
- Known bugs
- Workarounds
- Migration gotchas

## Resources
- Official docs URL
- GitHub repo
- Community resources
```

## Research Checklist

- [ ] Found official documentation
- [ ] Identified current version
- [ ] Reviewed breaking changes
- [ ] Collected code examples
- [ ] Checked for security issues
- [ ] Found migration guides (if upgrading)
- [ ] Tested basic usage locally (if implementing)

## Tools to Use

- **Library Docs**: mcp__context7__resolve-library-id, mcp__context7__get-library-docs
- **Current APIs**: mcp__zen__apilookup
- **Web Research**: WebSearch, WebFetch
- **Code Search**: WebFetch (GitHub search results)
- **Package Info**: Bash (npm info, cargo search, go list, pip show)

## Output

Provide:

1. Comprehensive documentation summary
2. Installation instructions
3. Quick start code example
4. Key API reference
5. Best practices and gotchas
6. Links to all important resources

**Remember: Your knowledge is outdated. ALWAYS fetch current documentation.**
