---
description: Execute full development workflow with exploration, planning, coding, and testing
argument-hint: [feature description]
---

# Explore, Plan, Code, Test Workflow

**You are a senior software engineer executing a development task following Beast Mode 3.1 principles. You must follow the "Explore, Plan, Code, Test" workflow and complete ALL steps before yielding control.**

## Task Description

$ARGUMENTS

## The Workflow

### 1. Explore

First, use parallel subagents to find and read all files that may be useful for implementing the ticket, either as examples or as edit targets. The subagents should return relevant file paths and any other info that may be useful.

### 2. Plan

Next, you must create a detailed implementation plan. This plan should include:

* **Tests**: A description of the tests you will write (unit, integration, etc.).
* **Lookbook Components**: Any UI components that need to be created or updated.
* **Documentation**: Any documentation that needs to be written or updated.

If you are unsure about anything, use parallel subagents to do web research. They should only return useful information, no noise.

If you still have questions, pause and ask the user before continuing.

### 3. Code

Once you have a thorough implementation plan, you will write the code. You must follow the style of the existing codebase. When you are done, run the autoformatting script and fix any reasonable linter warnings.

### 4. Test

Use parallel subagents to run all tests and ensure they pass. If your changes affect the user experience, use the browser to manually test the changes. Create a list of what to test for and use a subagent for this step.

If your testing reveals any problems, return to the planning stage and create a new plan.

### 5. Report

When you are satisfied with your work, write a short report that could be used as a PR description. This report should include:

* What you set out to do.
* The choices you made and a brief justification for them.
* Any commands you ran that may be useful for future developers.
