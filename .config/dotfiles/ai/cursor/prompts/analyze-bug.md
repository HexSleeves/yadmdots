# Analyze Bug

Systematic root cause analysis for bugs that resist quick fixes.

## Process

1. **Symptoms** - What exactly fails? Error messages, stack traces, conditions
2. **Reproduce** - Minimal steps to trigger the bug consistently
3. **Hypotheses** - List 3-5 possible causes ranked by likelihood
4. **Test** - For each hypothesis: how to confirm/eliminate it
5. **Root Cause** - Apply "5 Whys" to the confirmed hypothesis
6. **Fix** - Propose solution that addresses root cause, not symptoms

## Output Format

```
## Symptoms
[What's happening]

## Reproduction
[Minimal steps]

## Hypotheses
1. [Most likely] - Test: [how to verify]
2. [Second likely] - Test: [how to verify]
3. [Third likely] - Test: [how to verify]

## Root Cause
[The actual cause after testing hypotheses]

## Proposed Fix
[Solution addressing root cause]
```

## Rules

- Evidence over speculation
- Test hypotheses before concluding
- If still stuck after this analysis, ask for help
