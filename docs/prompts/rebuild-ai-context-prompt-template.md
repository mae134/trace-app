# AI Context Rebuild Prompt Template

This template is used to instruct an AI assistant to rebuild the AI project context from the current repository state.

The purpose is to regenerate the `.ai/` directory when the project context becomes outdated, inconsistent, or requires a full review.

## Workflow

Repository Review
↓
Analyze Current Project
↓
Rebuild AI Context
↓
Human Review (Optional)
↓
Continue Development

## Rules

- Write all updates in English.
- Rebuild the AI context using the current project as the source of truth.
- Replace outdated information.
- Preserve valid information when appropriate.
- Do not invent missing information.
- Do not infer or guess machine-readable values for `.ai/state.json`.
- Do not duplicate detailed documentation that already exists elsewhere.
- If required information is unavailable, clearly report it.
- Keep `.ai/context.md` concise.
- Keep `.ai/state.json` machine-readable and concise.
- Store only information that is expected to be consumed programmatically in `.ai/state.json`.
- Prefer references over duplicating existing documentation.
- If the project has evolved significantly, remove obsolete sections instead of preserving them.
- If any requested source is unavailable, continue using the remaining available sources and report which sources were unavailable.

When information conflicts, use the following priority:

1. Current GitHub Issue
2. AGENTS.md
3. ADRs
4. README.md
5. Existing AI Context

---

Rebuild the AI project context.

Before rebuilding, review the following:

- Current branch
- `.ai/context.md`
- `.ai/state.json`
- `README.md`
- `AGENTS.md`
- `docs/playbook/`
- `docs/prompts/`
- `docs/checklists/`
- `docs/history/`
- GitHub Issues (if available)
- Pull Requests (if available)
- Top-level repository structure

---

## Tasks

Review the current project and rebuild:

- `.ai/context.md`
- `.ai/state.json`

The rebuilt context should accurately represent the current project.

Review and update sections including:

- Project
- Current Status
- Current Goal (derived from the active GitHub Issue when available)
- Current Task (derived from the current branch or active GitHub Issue)
- Completed Work
- Pending Tasks
- Important Decisions
- Constraints
- Next Recommended Task
- Important References

Remove outdated information when necessary.

---

## Out of Scope

- Generate a handoff document.
- Modify unrelated project documents.
- Change project rules or workflows.
- Implement new features.

---

## Expected Output

Provide:

1. Updated `.ai/context.md`
2. Updated `.ai/state.json`
3. A summary describing what changed during the rebuild
4. Any recommendations for improving the AI context system (if applicable)

## Design Philosophy

The `.ai` directory should provide only the minimum context required for another AI assistant to continue the project.

Summarize project status instead of copying existing documentation.

Prefer references over duplication whenever possible.

It should not become a duplicate of the repository documentation.
