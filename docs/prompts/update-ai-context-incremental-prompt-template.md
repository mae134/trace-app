# AI Context Incremental Update Prompt Template

This template is used to instruct an AI assistant to update the AI project context after completing a GitHub Issue.

The purpose is to keep the `.ai/` directory synchronized with the latest project state while preserving existing valid context.

## Workflow

Implementation Completed
↓
Verification Completed
↓
Update AI Context
↓
Human Review (Optional)
↓
Continue Development

## Rules

- Write all updates in English.
- Update only the sections affected by the latest changes.
- Preserve existing valid information.
- Do not rewrite unrelated sections.
- Do not duplicate detailed documentation that already exists elsewhere.
- Use the repository as the source of truth.
- If required information is unavailable, clearly state it instead of guessing.

---

Update the AI project context.

Before updating, review the following:

- `.ai/context.md`
- `.ai/state.json`
- `AGENTS.md`
- GitHub Issue
- Approved Design (if applicable)
- Implementation summary
- Verification results
- Relevant repository documents (if necessary)

---

## Tasks

Update:

- `.ai/context.md`
- `.ai/state.json`

Only modify information affected by the latest implementation.

Examples include:

- Current Goal
- Current Status
- Current Task
- Completed Work
- Pending Tasks
- Next Recommended Task
- Current Branch
- Current Issue
- Project Status

Do not remove useful existing information unless it is outdated or incorrect.

---

## Expected Output

Provide:

1. Updated `.ai/context.md`
2. Updated `.ai/state.json`
3. A short summary describing what was updated

## Out of Scope

- Rebuild the entire AI context.
- Generate a handoff document.
- Modify unrelated project documents.
- Change project rules or workflows.