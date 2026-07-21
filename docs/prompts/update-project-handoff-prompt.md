# Update Project Handoff Prompt

## Purpose

Update `docs/project/handoff.md` so it accurately reflects the long-term state of the project.

This document is **not** a session handoff.
It is the long-term project knowledge that allows a new ChatGPT conversation to understand the project without requiring additional explanation.

Always update the existing document instead of recreating it from scratch.

---

## Output Requirements

- Output the result as a **Markdown (.md) file**.
- Generate the complete updated Markdown document as a downloadable file.
- Do not truncate the document because of chat length.
- Preserve existing headings whenever possible.
- Update only sections affected by new information.

---

## Responsibilities

Include:
- Project overview
- Product vision
- Long-term goals
- Current phase
- Roadmap
- Current position
- Completed milestones
- Open milestones
- Major decisions
- Project history
- Long-term constraints
- Future direction

Do NOT include:
- Current branch
- Current commit
- Git status
- Pull Request status
- Temporary implementation notes
- Session-only information

Those belong to:
- .ai/context.md
- .ai/state.json
- .ai/handoff.md

---

## Source Priority

Use the following sources in order of authority.

1. Existing `docs/project/handoff.md`
2. `AGENTS.md`
3. `README.md`
4. Product documentation
5. ADRs
6. Roadmaps
7. GitHub Issues
8. `.ai/context.md`
9. `.ai/handoff.md`
10. Recent conversation

Do not invent missing information.

---

## Update Rules

- Preserve valid information.
- Remove obsolete information.
- Merge duplicate content.
- Keep historical context.
- Update roadmap.
- Update milestones.
- Update project phase.
- Update major decisions.
- Keep chronology clear.
- Do not duplicate README.
- Do not duplicate AI Context.
- Prefer summaries over duplication.

---

## Required Sections

# Project Handoff

## Purpose
## Project Overview
## Product Vision
## Current Phase
## Roadmap
## Current Position
## Completed Milestones
## Open Milestones
## Major Decisions
## Project History
## Long-term Constraints
## Future Direction
## Update History

---

## Knowledge Extraction

Before updating the Project Handoff, analyze all available sources and identify information that represents long-term project knowledge.

Consider the following:

- Significant decisions made during recent discussions.
- Changes to the product vision or project direction.
- Roadmap progress and current project phase.
- Relationships between GitHub Issues, milestones, and major initiatives.
- Newly completed or newly started milestones.
- Major architectural or workflow decisions.
- Changes that affect the long-term understanding of the project.
- Significant project transitions.

For each identified item:

1. Determine whether it belongs in the Project Handoff.
2. Merge it into the appropriate section instead of creating duplicate information.
3. If it represents a historical milestone, record it in chronological order.
4. If it changes the current project state, update the relevant section accordingly.

Do not record temporary discussions, speculative ideas, or unfinished decisions unless they have been explicitly adopted.

---

## Final Output

Return:

1. The updated `docs/project/handoff.md` as a Markdown (.md) file.
2. A summary of the changes made.
3. Missing or unverified information.
4. Optional recommendations for improving the Project Handoff structure.
