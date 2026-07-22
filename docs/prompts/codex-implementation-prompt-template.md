# Codex Implementation Prompt

This template is used by an AI assistant to generate an implementation prompt for an AI coding agent.

## Workflow

Human
↓
GitHub Issue + Approved Design
↓
AI Assistant
↓
Generate Implementation Prompt
↓
Human Review
↓
AI Coding Agent
↓
Implementation
↓
Japanese Implementation Report

## Rules

- Write the implementation prompt in English.
- Write the final implementation report in Japanese.
- Write the implementation prompt as a Markdown (`.md`) file.

## Expected Output

Generate a single Markdown (`.md`) file.

The output filename must be:

`implementation-prompt-{{ISSUE_ID}}.md`

---

Implement **{{ISSUE_ID}}**.

Current branch:

- `{{BRANCH_NAME}}`

Please implement this issue on the current branch.
Do not create or switch branches unless explicitly requested.

Before making any code or documentation changes, please read the following:

- `AGENTS.md`
- GitHub Issue
- Approved Design

---

## GitHub Issue

The GitHub Issue defines **what** should be implemented.

{{GITHUB_ISSUE}}

---

## Approved Design

The Approved Design defines **how** the implementation should be performed.

{{APPROVED_DESIGN}}

---

## Requirements

- Follow all rules defined in `AGENTS.md`.
- Implement only the requested scope described in the GitHub Issue.
- Do not modify files outside the approved scope.
- Do not implement anything listed under **Out of Scope**.
- Follow the Approved Design during implementation.
- Do not modify the Approved Design.
- If any requirement is unclear, explain your assumptions before implementing.
- If you believe the issue should be split into smaller tasks, explain your reasoning before implementing.
- If you identify improvements outside the scope, report them as recommendations instead of implementing them.
- If deprecated APIs or warnings are found, verify the relevant library versions before applying changes.
- Write code comments in Japanese only when they are necessary to explain intent, design decisions, constraints, assumptions, workarounds, or other non-obvious behavior.
- Do not add comments that merely restate what the code already expresses.

---

## Before Implementation

Before editing any files, report:

1. Implementation approach
2. Files to be changed
3. Assumptions
4. Potential risks (if any)

Wait for approval only if explicitly instructed.

---

## After Implementation

Please report:

1. Summary of changes
2. Changed files
3. Commands executed
4. Verification results
5. Execution Log
6. Recommendations (maximum 3)

Run relevant tests or verification steps when applicable.

Proactively execute relevant read-only and verification commands according to the Command Execution Policy defined in `AGENTS.md`.

Do not commit unless explicitly requested.
