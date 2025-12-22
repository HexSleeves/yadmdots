---
description: Comprehensive code refactoring with planning and execution
argument-hint: [file or component to refactor]
---

# Refactor

Comprehensive refactoring workflow that analyzes, plans, and executes code improvements systematically.

**Target:** $ARGUMENTS

## Refactoring Protocol

This command orchestrates a complete refactoring workflow:

1. **Analysis Phase** (refactor-planner agent):
   - Analyze current code structure and identify issues
   - Detect code smells, duplication, and architectural concerns
   - Map dependencies and affected components
   - Assess risks and complexity

2. **Planning Phase** (refactor-planner agent):
   - Create detailed step-by-step refactoring plan
   - Break down into logical, incremental phases
   - Prioritize changes by impact and risk
   - Define acceptance criteria for each step

3. **Review Gate**:
   - Present plan to user for approval
   - Discuss alternatives and trade-offs
   - Get explicit go/no-go decision

4. **Execution Phase** (code-refactor-master agent):
   - Execute refactoring following the approved plan
   - Move files and update all import paths
   - Extract components and simplify code
   - Fix anti-patterns and improve organization
   - Ensure zero breakage through dependency tracking

5. **Validation Phase**:
   - Run all tests to verify functionality
   - Check for broken imports or references
   - Validate adherence to best practices
   - Confirm improved maintainability

## When to Use

- Breaking down large components into smaller, focused units
- Reorganizing messy file structures
- Modernizing legacy code patterns
- Removing code duplication
- Improving code organization and clarity
- Simplifying complex logic while preserving behavior

## What This Includes

This command consolidates:

- ~~`/quality:refactor`~~ - Systematic refactoring (now here)
- ~~`/simplify`~~ - Code simplification (now part of execution)
- `refactor-planner` agent - Creates the plan
- `code-refactor-master` agent - Executes the refactoring

## Refactoring Principles

- **Zero Breakage**: All imports tracked, all functionality preserved
- **Incremental**: Changes made in small, testable steps
- **Tested**: Tests run after each significant change
- **Documented**: Changes explained and justified
- **Reversible**: Each phase can be rolled back if needed

## Output

You will receive:

1. Detailed refactoring plan (saved to `/dev/active/[task]/refactor-plan.md`)
2. Risk assessment and mitigation strategies
3. Step-by-step execution with progress updates
4. Validation results and test outcomes
5. Summary of improvements made

## Example Usage

```bash
# Refactor a large component
/refactor Dashboard.tsx

# Reorganize a messy directory structure
/refactor src/components/

# Modernize legacy authentication code
/refactor services/auth/

# Remove duplication across services
/refactor "payment processing logic"
```

## Quality Standards

- No component > 300 lines (excluding imports)
- No file > 5 levels of nesting
- Clear single responsibility per module
- Proper separation of concerns
- Consistent patterns throughout

Remember: Good refactoring improves maintainability without changing behavior.
