# approved-design-{{ISSUE_ID}}.md

## Goal

Implement a Bash script that automatically generates and creates a GitHub Pull Request using Codex CLI.

The script should collect the required repository information, invoke Codex CLI with the Pull Request Draft Prompt Template, and create a GitHub Pull Request without requiring the user to manually prepare a Pull Request draft.

---

## Scope

Implement a Pull Request creation workflow that:

- Accepts a GitHub Issue number as input.
- Retrieves the corresponding GitHub Issue.
- Collects Git metadata required for Pull Request generation.
- Invokes Codex CLI with the Pull Request Draft Prompt Template.
- Generates a Pull Request title and body.
- Displays the generated content for user confirmation.
- Creates the GitHub Pull Request using GitHub CLI.
- Documents the usage in the repository.

---

## Out of Scope

- Manual Pull Request Draft file creation.
- Local storage of generated Pull Request Drafts.
- Manual editing of generated Pull Request content.
- GitHub Actions integration.
- Automatic Pull Request review or merge.
- AI Context updates.
- Repository workflow changes outside this feature.

---

## Design Policy

The implementation should treat Codex CLI as the AI responsible for generating the Pull Request title and body.

The Bash script should act only as an orchestrator by:

1. Collecting implementation context.
2. Passing the collected information and prompt template to Codex CLI.
3. Receiving the generated Pull Request.
4. Asking for Human confirmation.
5. Creating the Pull Request through GitHub CLI.

The generated Pull Request content should not be stored as a local temporary file unless technically required by the implementation. GitHub should remain the final source of truth for the generated Pull Request.

---

## Architecture Impact

### Application Architecture

No impact.

### Repository Workflow

Adds a new automated Pull Request creation workflow.

### AI Workflow

Extends the AI-assisted workflow by allowing Codex CLI to automatically generate Pull Request content.

### Documentation

README usage documentation will be updated.

### AI Context

No impact.

---

## Implementation Plan

1. Create `scripts/create-pull-request.sh`.
2. Validate required tools (Git, GitHub CLI, Codex CLI).
3. Accept the GitHub Issue number as input.
4. Retrieve the GitHub Issue.
5. Collect repository information including:
   - Current branch
   - Changed files
   - Git diff
   - Commit history
6. Load the Pull Request Draft Prompt Template.
7. Invoke Codex CLI with:
   - Issue information
   - Git metadata
   - Prompt template
8. Receive the generated Pull Request title and body.
9. Display the generated Pull Request for Human confirmation.
10. Create the Pull Request using GitHub CLI.
11. Update README usage documentation.

---

## Files to Modify

```text
scripts/create-pull-request.sh
README.md
docs/prompts/pull-request-draft-prompt-template.md (only if required)
```

---

## Verification Plan

- Manual workflow verification
- Shell syntax check (`bash -n`)
- ShellCheck
- Script execution using a test Issue
- Successful GitHub Pull Request creation

---

## Risks

- Codex CLI output format may change and require parser adjustments.
- GitHub CLI authentication or permission issues may prevent Pull Request creation.
- Large Git diffs may exceed practical prompt size limits.

---

## Assumptions

- Codex CLI is installed and authenticated.
- GitHub CLI is installed and authenticated.
- The Pull Request Draft Prompt Template exists.
- The current Git branch is ready for Pull Request creation.

---

## Expected Deliverables

- `scripts/create-pull-request.sh`
- Updated README documentation
- Supporting tests or validation updates (if applicable)

---

## Human Approval Checklist

- [ ] Scope is correct.
- [ ] Out of Scope is clear.
- [ ] Design matches the GitHub Issue.
- [ ] Planned files are appropriate.
- [ ] Verification plan is appropriate.
