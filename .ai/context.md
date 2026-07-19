# Project Context

## Project

Codex Playground is a Next.js memo app and a learning repository for establishing an AI-assisted, Issue-driven development workflow before applying it to Trace App.

## Current Goal

Complete the Phase 1 retrospective and keep the workflow usable through small, evidence-based improvements, then apply the validated approach to Trace App.

## Current Status

- The memo app's core features and UI improvement are complete, including Local Storage persistence.
- The repository now includes agent rules, an AI development playbook, reusable prompts, checklists, Approved Designs, review history, Issue/PR templates, CI, and shared AI context.
- The Phase 1 retrospective and related documentation updates are committed on `docs/project-retrospective` and await the remaining GitHub workflow steps.
- The worktree was clean before this context rebuild. No Pull Request exists for the current branch.

## Current Task

Rebuild `.ai/context.md` and `.ai/state.json` for open Issue #70, **Rebuild AI Context**, using the repository as the source of truth.

## Completed Work

- Implemented display, add, delete, edit, persistence, and UI improvements for the memo app.
- Established the Issue -> Approved Design -> Implementation -> review -> PR workflow and supporting repository documentation.
- Added the Phase 1 retrospective at `docs/retrospectives/2026-codex-playground-phase1.md` in commit `bcce04d`.

## Pending Tasks

- Review this rebuilt AI context and complete Issue #70.
- Complete the review, Pull Request, and merge steps for the retrospective work associated with Issue #17.
- Continue evaluating Issue #5, **GitHub Issues・Projects導入**; its required next action is not documented in the local repository.

## Important Decisions

- The Human owns direction, approval, final review, push, and merge; Codex commits only when explicitly requested.
- GitHub Issues define what to implement; Approved Designs define how to implement it.
- Keep AI context minimal and reference repository documentation instead of duplicating it.
- Record improvement ideas in History and validate them before changing the Playbook, prompts, or checklists.

## Constraints

- Follow `AGENTS.md`; keep `main` stable and preserve unrelated user changes.
- Do not add application code, tooling, CI, or automation without an approved Issue.
- Do not push or merge, and do not commit unless explicitly requested.
- Do not invent unavailable project or GitHub state.

## Next Recommended Task

Review the rebuilt `.ai` files, then complete the Human-owned review and Git workflow for Issue #70 and the retrospective branch.

## Important References

- `AGENTS.md`: agent-facing repository rules.
- `README.md`: project overview, structure, setup, and development flow.
- `.ai/README.md`: AI context purpose and update rules.
- `docs/playbook/ai-development-playbook.md`: human-facing workflow guidance.
- `docs/retrospectives/2026-codex-playground-phase1.md`: current Phase 1 retrospective.
- `docs/design/approved/17-project-retrospective.md`: approved retrospective design.
- `docs/prompts/`, `docs/checklists/`, and `docs/history/`: reusable workflow material and recorded findings.

## Unavailable Information

- GitHub Issue and Pull Request lists were available, but detailed Issue bodies were unavailable during this rebuild because GitHub API access failed.
- GitHub Project board state was not reviewed.
