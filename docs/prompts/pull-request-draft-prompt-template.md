# Pull Request Draft Generation Prompt

This template is used to instruct the AI Coding Agent that performed the implementation to generate a GitHub Pull Request draft.

## Workflow

Implementation Completed
↓
AI Coding Agent
↓
Generate Pull Request Draft
↓
Human Review
↓
Create Pull Request

## Rules

- Generate the Pull Request draft in Japanese.
- Generate the Pull Request title in Japanese.
- Prefix the Pull Request title with the appropriate Conventional Commits type (`feat:`, `fix:`, `docs:`, `refactor:`, `chore:`, etc.).
- Write the output as a single Markdown (`.md`) file.
- The output filename must be `pr-draft-{{ISSUE_ID}}.md`.
- Use the GitHub Issue, Implementation Summary, and Verification Results as the source of truth.
- Ensure the Pull Request accurately reflects the approved GitHub Issue.
- Do not include any Out of Scope changes.
- Only describe changes that were actually implemented.
- Only include verification steps that were actually executed.
- Do not speculate or invent functionality.
- Keep the draft concise and easy to review.
- Do not include implementation details that are irrelevant to reviewers.
- Include a `Closes {{ISSUE_ID}}` section only when the Pull Request fully completes the GitHub Issue.
- If the GitHub Issue is only partially completed or should remain open, omit the `Closes` section.

## Expected Output

Generate a single Markdown (`.md`) file.

The output filename must be:

`pr-draft-{{ISSUE_ID}}.md`

---

The implementation for **{{ISSUE_ID}}** has been completed.

Please generate a GitHub Pull Request draft.

Before generating the draft, review the following:

- `AGENTS.md`
- GitHub Issue
- Implementation Summary
- Verification Results

---

## GitHub Issue

{{GITHUB_ISSUE}}

---

## Implementation Summary

{{IMPLEMENTATION_SUMMARY}}

---

## Verification Results

{{VERIFICATION_RESULTS}}

---

Generate the Pull Request using the Markdown template below.

# Title

{{PR_TITLE}}

## Closes (Optional)

Closes {{ISSUE_ID}}

## Summary

{{SUMMARY}}

## Changes

- ...

## Verification

- ...
