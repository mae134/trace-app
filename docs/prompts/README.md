# Prompts

This directory contains prompt templates used for ChatGPT, Codex, and other AI assistants.

These templates standardize AI instructions, improve consistency, and help maintain a high-quality AI-assisted development workflow.

---

# Purpose

- Standardize instructions provided to AI assistants
- Avoid creating prompts from scratch for every task
- Maintain a consistent development workflow
- Continuously improve prompt quality

---

# Templates

## `issue-prompt-template.md`

Generates GitHub Issue descriptions for human review.

## `codex-implementation-prompt-template.md`

Generates implementation prompts for Codex.

## `approved-design-prompt-template.md`

Generates Approved Design documents before implementation begins.

## `pull-request-draft-prompt-template.md`

Generates Pull Request draft descriptions.

## `generate-ai-handoff-prompt-template.md`

Generates AI handoff documents for transferring project context between AI assistants.

## `update-ai-context-incremental-prompt-template.md`

Incrementally updates the `.ai/` project context after completing a GitHub Issue.

## `rebuild-ai-context-prompt-template.md`

Rebuilds the `.ai/` project context from the current repository state.

## `generate-git-metadata-prompt-template.md`

Generates Git metadata summaries for AI-assisted workflow handoffs and reviews.

## `repository-documentation-update-prompt-template.md`

Reviews repository documentation after implementation and updates affected documents when necessary.

## `repository-review-prompt-template.md`

Reviews the current repository state without modifying files.

---

# Workflow

GitHub Issue
↓
Implementation Prompt
↓
Implementation
↓
Repository Documentation Review
↓
AI Context Update (if needed)
↓
Pull Request Draft

---

# Rules

- Design prompts to be reusable whenever possible.
- Record prompt improvement ideas in `docs/history/` before adopting them.
- Update prompt templates only after the improvements have been validated.

---

# Documentation Guidelines

- Keep this `README.md` entirely in English.
- Write all new and modified README content in English.
- Keep the README concise and focused on the purpose of its directory.
