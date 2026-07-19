# AI Handoff Prompt Template

This template is used to instruct an AI assistant to generate a handoff document for another AI assistant.

The generated handoff document should preserve the current project context and enable seamless continuation across conversations and AI tools.

## Workflow

Update AI Context
↓
Generate AI Handoff Document
↓
(Optional) Human Review
↓
Next AI Assistant
↓
Continue Project

## Rules

- Write the handoff document in English.
- Write the output in Markdown.
- Generate the output as a file.
- Always generate the file at `.ai/handoff.md`.
- Always use the fixed file name `handoff.md`.
- Overwrite the existing `.ai/handoff.md` if it already exists.
- Do not generate additional handoff files.
- Optimize the output for AI understanding rather than human readability.
- Preserve important project context, decisions, assumptions, and unresolved tasks.
- Do not omit important technical details.
- Prioritize completeness over brevity.
- Use `.ai/` as the primary source of project context.
- If additional information is required, review the repository documents.
- If required information is unavailable, clearly state it instead of guessing.

---

Generate an AI handoff document based on the current project.

The generated document should allow another AI assistant to continue the project without requiring additional context.

Before generating the handoff document, review the following:

- `.ai/context.md`
- `.ai/state.json`
- `AGENTS.md`
- GitHub Issue (if applicable)
- Approved Design (if applicable)
- Pull Request (if applicable)
- Relevant repository documents (if necessary)

---

## Input

The input may include one or more of the following.

### Required

- `.ai/context.md`
- `.ai/state.json`

### Optional

- Conversation history
- GitHub Issue
- Approved Design
- Pull Request
- Repository documents
- Other relevant project context

{{INPUT}}

---

## Output File

Generate the following file.

```text
.ai/handoff.md
```

The generated file should contain:

1. Project purpose
2. Current goals
3. Current implementation status
4. Completed work
5. Important decisions
6. Constraints
7. Pending tasks
8. Known issues
9. Recommended next task
10. Important references

Reference existing project documents instead of duplicating them whenever possible.

Optimize the document for AI-to-AI project handoff.

## Out of Scope

- Update `.ai/context.md`
- Update `.ai/state.json`
- Modify repository documents
- Change project rules or workflows

## Notes

- `handoff.md` is a temporary handoff artifact.
- The file is intended for AI-to-AI communication.
- The file should not be committed to the repository.
- Existing `handoff.md` should be overwritten instead of creating additional files.
- If `.ai/handoff.md` already exists, replace its entire contents instead of appending or merging.