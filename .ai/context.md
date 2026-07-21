# Project Context

## Project

Trace App is a Next.js web application intended to help learners study trace problems in Subject B of Japan's Fundamental Information Technology Engineer Examination (FE). The repository is currently establishing the product and its AI-assisted, Issue-driven development foundation.

## Current Status

- The repository contains the initial Next.js application scaffold.
- Repository governance, branch automation, CI, formatting, linting, type checking, and Vitest support have been established.
- Issue #7, **AI Contextを構築する**, is in progress on `chore/setup-ai-context`.
- No Pull Request exists for the current branch.
- Several product-definition, architecture, infrastructure, and feature Issues remain open.

## Current Goal

Complete Issue #7 by providing a minimal, maintainable AI context that communicates the repository's current state and points to authoritative project documentation without duplicating it.

## Current Task

Rebuild `.ai/context.md` and `.ai/state.json` from the current Trace App repository state. The related `.ai/README.md` work is already present in the worktree and is outside this rebuild's requested files.

## Completed Work

- Initialized the development foundation and localized the repository documentation.
- Configured GitHub repository management and the `feature/*` -> `dev` -> `main` release flow.
- Added CI and code-quality tooling, including ESLint, Prettier, TypeScript checks, Vitest, Husky, lint-staged, commitlint, and Dependabot.
- Added Issue/PR templates and a script for creating Issue branches.

## Pending Tasks

- Review and complete the remaining deliverables for Issue #7.
- Address the open product-definition, architecture, infrastructure, and feature Issues in their approved order.
- Review the open Dependabot Pull Requests separately; dependency updates are outside Issue #7.

## Important Decisions

- GitHub Issues define requirements; Approved Designs define implementation decisions.
- Feature work flows through `feature/*` to `dev`, then through a release Pull Request to `main`.
- The Human owns approval, push, merge, and final review; Codex commits only when explicitly requested.
- AI context is maintained manually, kept minimal, and should reference existing documentation rather than reproduce it.

## Constraints

- Follow `AGENTS.md` and the active GitHub Issue.
- Do not implement unapproved work or modify files outside the requested scope.
- Preserve unrelated worktree changes.
- Do not push or merge, and do not commit unless explicitly requested.
- Do not invent unavailable project state or machine-readable values.

## Next Recommended Task

Have the Human review the Issue #7 deliverables, then complete the approved commit and Pull Request workflow for `chore/setup-ai-context`.

## Important References

- `AGENTS.md`: authoritative agent rules and Git workflow.
- `README.md`: product overview, repository structure, setup, and commands.
- `.ai/README.md`: purpose and maintenance rules for AI context.
- `docs/playbook/ai-development-playbook.md`: human-facing AI development guidance.
- `docs/design/`: Approved Design responsibilities and records.
- `docs/prompts/`, `docs/checklists/`, and `docs/history/`: reusable workflow material and improvement history.
- GitHub Issue #7: current requirements and acceptance criteria.

## Unavailable Information

- Issue #7 has no milestone or GitHub Project assignment.
- The repository does not currently contain ADR files beyond the documented ADR directory reference.
