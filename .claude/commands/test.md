---
description: Generate comprehensive tests with edge case coverage
argument-hint: [file or function to test]
---

# Test

Generate comprehensive tests for: $ARGUMENTS

## Test Workflow

### 1. Understand the Code

- Use Read to examine the target code
- Identify all code paths and branches
- Note input parameters and return values
- Understand dependencies and side effects
- Check existing tests with Glob patterns like `**/*_test.go` or `**/*.test.ts`

### 2. Research Testing Patterns

Use WebSearch/WebFetch to find:

- Testing best practices for the language/framework
- Common testing patterns for similar code
- Edge cases to consider
- Mocking strategies for dependencies

For library-specific testing:

- Use mcp__context7__resolve-library-id + mcp__context7__get-library-docs
- Use mcp__zen__apilookup for current testing APIs

### 3. Design Test Cases

Use mcp__zen__testgen for systematic test planning:

- Happy path scenarios
- Edge cases and boundary conditions
- Error conditions and exceptions
- Integration points
- Performance considerations

### 4. Test Categories

Generate tests for:

**Unit Tests**

- Individual function behavior
- All code branches
- Error handling
- Boundary values

**Integration Tests**

- Component interactions
- API contracts
- Database operations
- External service calls

**Edge Cases**

- Null/undefined/empty inputs
- Maximum/minimum values
- Concurrent access
- Invalid data types

### 5. Implementation

- Follow existing test patterns in the codebase
- Use appropriate test framework (pytest, jest, go test, cargo test, etc.)
- Include setup/teardown as needed
- Mock external dependencies
- Aim for 95%+ coverage for critical paths

### 6. Validation

Run tests with Bash:

- Verify all tests pass
- Check coverage reports
- Ensure tests are isolated
- Validate test performance

## Testing Standards by Language

### Go

```bash
go test ./... -v -race -cover
```

- Use table-driven tests
- Mock interfaces with testify/mock
- Check race conditions with -race

### TypeScript/JavaScript

```bash
npm test -- --coverage
# or
bun test --coverage
```

- Use Jest/Vitest
- Mock with vi.mock() or jest.mock()
- Test React components with Testing Library

### Rust

```bash
cargo test
```

- Use #[cfg(test)] modules
- Leverage #[should_panic] for error cases
- Use proptest for property testing

### Python

```bash
pytest -v --cov=. --cov-report=term-missing
```

- Use pytest fixtures
- Mock with pytest-mock or unittest.mock
- Parametrize tests with @pytest.mark.parametrize

### Java

```bash
mvn test
# or
gradle test
```

- Use JUnit 5
- Mock with Mockito
- Consider Testcontainers for integration tests

## Test Quality Checklist

- [ ] Tests are independent (no shared state)
- [ ] Tests are deterministic (no flaky tests)
- [ ] Tests are fast (mock slow dependencies)
- [ ] Tests have clear names describing what they test
- [ ] Tests follow AAA pattern (Arrange, Act, Assert)
- [ ] Edge cases are covered
- [ ] Error conditions are tested
- [ ] Tests document expected behavior

## Output

Provide:

1. Complete test file(s) with all test cases
2. Coverage report analysis
3. Instructions to run the tests
4. Any setup/configuration needed
