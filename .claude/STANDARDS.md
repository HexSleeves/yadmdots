# Code Standards

Language-specific coding standards and tooling preferences.

## Universal Rules

- Write clear, descriptive test names
- Run single tests over full suites for performance
- Use semantic commit messages (feat:, fix:, docs:, etc.)
- Format code before committing
- Never commit without running pre-commit checks
- TestContainers for integration tests

## TypeScript

**Runtime:** Bun (fastest) or Node.js 20+ with `--experimental-strip-types`
**Package Manager:** Context-aware - `npm` (established projects), `bun`/`pnpm` (new projects)
**Build Tool:** Nx (monorepos), Vite 5+ with SWC, or Turbo
**Type Checker:** `tsc --noEmit` in CI, `@typescript/analyze-trace` for perf
**Linting:** Biome (fastest) or ESLint 9+ flat config
**Formatting:** Biome (fastest) or Prettier with `--cache`
**Testing:** Vitest (Vite-native), Jest (established), or Bun test
**Type Definitions:** Use `@types/node` v20+, avoid legacy `@types`

### Monorepo Specifics (Nx)

- Enable `isolatedModules: true` and `verbatimModuleSyntax: true`
- Use `"moduleResolution": "bundler"` with path mapping
- Leverage Nx caching with `nx affected` commands
- Configure project references for incremental builds
- Use barrel exports through `index.ts` files

### Performance Optimizations

- Set `"target": "ES2022"` minimum for latest features
- Enable `incremental: true` and `composite: true` for project references
- Use `skipLibCheck: true` in development, `false` in CI
- Configure Nx task orchestration for parallel execution

### Developer Experience

- VS Code with TypeScript 5.8+ and strict mode
- Enable `"exactOptionalPropertyTypes": true` for better type safety
- Use `satisfies` operator over type assertions
- Prefer `as const` assertions for immutable data
- Enable `"noUncheckedIndexedAccess": true` for array safety

### Nx Commands

```bash
# Affected operations (ALWAYS use for performance)
nx affected -t build --parallel=4
nx affected -t test --exclude 'components,storybook-host'
nx affected -t lint --parallel=8

# Project-specific operations
nx run-many --target=test --projects="channel-*"
nx run-many --target=build --projects="australia-*"

# Generation and analysis
nx g @nx/react:library my-feature --directory=libs/features/common
nx graph --affected
```

## Go

- Use ConnectRPC for RPC services
- Target 95%+ test coverage
- Table-driven tests standard

## Rust

- Use Axum + Tokio for web services
- Hybrid testing: parallel units, sequential integration

## Java

- Spring Boot with Quarkus
- jOOQ over JPA

## Forbidden vs Allowed Tools

### ALLOWED

- Modern CLI: `rg`, `fd`, `bat`, `eza`, `jq`, `yq`, `fzf`, `delta`
- Git worktrees for parallel development
- GitHub CLI (`gh`) for all GitHub operations
- Bash/Python/Bun TypeScript for scripting

### FORBIDDEN

- Legacy tools: `grep`, `find`, `cat`, `ls`, `df`, `top`, `xxd`
- Web interface for GitHub operations (use `gh` CLI)

## Modern CLI Examples

```bash
# Search code (NEVER use grep)
rg "pattern" --type rust
rg "function.*async" --type typescript

# Find files (NEVER use find)
fd ".rs$" src/
fd ".tsx?$" --exclude node_modules

# View files (NEVER use cat)
bat src/main.rs

# List files (NEVER use ls)
eza -la --git

# Process JSON (ALWAYS use jq)
kubectl get pods -o json | jq '.items[].metadata.name'

# TypeScript tooling
bun run script.ts
tsc --noEmit --project tsconfig.json
biome check --apply src/
vitest run --reporter=verbose
```
