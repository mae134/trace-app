# AGENTS.md v1.3

This file defines the rules Codex must follow when working in this repository.
It should stay concise and be updated when the AI development workflow changes.

## Project overview

- This repository contains Trace App, a web application that helps learners master Subject B of the Fundamental Information Technology Engineer Examination (FE).
- The project uses an AI-assisted development workflow based on GitHub Issues, Approved Design, Pull Requests, and AI collaboration.
- Follow the documented workflow and implement only work that has been explicitly requested and approved.

## Team roles

- Human: Product Owner and Tech Lead. Owns direction, requirements, issue approval, final review, push, and merge.
- ChatGPT: Architect and Mentor. Supports design, review, workflow improvement, and technical discussion.
- Codex: Developer. Drafts issues when asked, implements approved work, tests changes, prepares commits when asked, and explains implementation results.

## Development workflow

- Work from an approved GitHub Issue or an explicitly provided prompt before making changes.
- Follow the flow: Idea -> GitHub Issue -> Approved Design -> Implementation -> Review -> Commit -> Push -> Pull Request -> Merge.
- Treat Human approval as the boundary before implementation when an issue requires approval.
- Keep scope small: one issue should represent one feature or one focused change.
- Explain assumptions when requirements are incomplete.

### Git Workflow

Always follow this branch strategy.

```text
feature/*
    │
    ▼
Pull Request
    │
    ▼
dev
    │
    ▼
Staging Deployment
    │
    ▼
Pull Request
    │
    ▼
main
    │
    ▼
Production Deployment
```

#### Rules

- Never commit directly to `main`.
- Never commit directly to `dev`.
- Create one `feature/*` branch per GitHub Issue.
- Merge completed work into `dev` via Pull Request.
- Keep `dev` deployable at all times.
- Merge `dev` into `main` via Pull Request when a release is ready.
- Keep `main` stable.
- Use one branch per issue and one feature per branch when branch work is requested.
- Do not push or merge; the Human owns those steps.
- Preserve existing user changes and do not modify unrelated files.
- Use the repository's Git metadata convention when generating branch names.


## Commit policy

- Commit only when explicitly requested.
- Keep commits focused on the requested issue.
- Use clear commit messages that describe the completed change.
- After committing, report the commit hash and what was included.

## Implementation rules

- Keep changes limited to the requested scope.
- Prefer small, reviewable changes.
- Do not introduce speculative architecture.
- Do not add secrets or environment-specific values.
- Keep documentation concise and current.
- Respect file responsibilities:
  - GitHub Issues are used to manage tasks and requirements.
  - `docs/prompts/` stores reusable prompts for AI-assisted development.
  - `docs/playbook/` stores human-facing AI development guidance.

## Command execution policy

The AI coding agent should proactively execute commands required to inspect the repository and verify its work when permitted by the execution environment.

### Read-only commands

Read-only commands may be executed without requesting Human approval.

Examples include:

- `git status`
- `git diff`
- `git log`
- `git show`
- `git branch --show-current`
- `git remote -v`
- `gh issue list`
- `gh issue view`
- `gh pr list`
- `gh pr view`
- `gh repo view`
- `ls`
- `find`
- `tree`
- `cat`
- `grep`
- `head`
- `tail`
- `pwd`

### Verification commands

Only execute verification commands that are relevant to the current task, supported by the project, and do not modify project state.

Examples include:

- `npm run lint`
- `npm test`
- `npm run test`
- `npm run build`
- `npm run typecheck`
- `curl` (GET / HEAD requests)

Only execute commands that are relevant to the current task and supported by the project.

### Commands requiring Human approval

Request explicit Human approval before executing commands that modify repository history, remote resources, project state, or user data.

Examples include:

- `git commit`
- `git push`
- `git reset`
- `git rebase`
- `git clean`
- `git branch -D`
- `gh issue create`
- `gh issue edit`
- `gh issue close`
- `gh pr create`
- `gh pr edit`
- `gh pr merge`
- State-changing HTTP requests (`POST`, `PUT`, `PATCH`, `DELETE`)
- `rm` or other destructive file operations

Do not bypass approval requirements imposed by the execution environment.

The execution environment may still require Human approval for some otherwise permitted commands (for example, local server startup or localhost HTTP requests). Follow the environment's approval requirements when prompted.

If the purpose or impact of a command is unclear, explain it and request Human approval before execution.

## Testing expectations

- Run relevant checks when changes can be verified locally.
- For documentation-only changes, review the changed document for clarity, scope, and consistency.
- If a check is not run, explain why in the final response.

## Change policy

- Update `AGENTS.md` when agent-facing workflow rules change.
- Keep human-facing process details in the Playbook instead of duplicating them here.
- Update AI context when major workflow, architecture, or repository changes occur, or when explicitly requested by the Human.
- Do not modify files outside the requested scope.

## Definition of done

An agent task is done when:

- The requested files or changes are complete.
- Scope boundaries were respected.
- Relevant verification was performed or clearly skipped with a reason.
- The final response lists changed files and their purpose.