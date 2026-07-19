# .ai Directory

## Purpose

`.ai/` is a shared project context directory for AI coding agents.

It provides the minimum information required for AI agents to quickly understand the current project status and continue development consistently across conversations and tools.

## Directory Structure

```text
.ai/
├── README.md
├── context.md
└── state.json
```

## Files

### README.md

Describes the purpose, structure, and usage of the `.ai/` directory.

### context.md

Stores a human-readable summary of the current project context.

Examples:

- Current goals
- Current progress
- Important decisions
- Pending tasks
- Next recommended task

### state.json

Stores machine-readable project state.

Examples:

- Current branch
- Current GitHub Issue
- Current status
- Last updated

## Update Rules

The files in this directory are updated manually.

Update them when:

- Starting a new task
- Completing a GitHub Issue
- Preparing to continue work in a new conversation
- When significant project changes occur

## Design Principles

- AI tool independent
- Human readable when possible
- Keep only the minimum required context
- Reference existing project documentation instead of duplicating information

## References

- AGENTS.md
- docs/playbook/
- docs/prompts/
- docs/checklists/
- docs/history/

---

# Documentation Guidelines

- Keep this `README.md` entirely in English.
- Write all new and modified README content in English.
- Keep the README concise and focused on the purpose of its directory.