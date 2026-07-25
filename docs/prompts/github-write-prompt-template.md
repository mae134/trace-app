# GitHub Write Prompt Template

This template is used to instruct an AI assistant or coding agent to safely perform GitHub write operations after explicit Human approval.

## Purpose

- Safely perform GitHub write operations.
- Separate planning from execution.
- Reuse the same workflow across all GitHub resources.
- Require explicit Human approval before any write operation.
- Verify the resulting GitHub state after execution.

## Operation Mode

Specify one of the following modes:

- `Create`
- `Update`
- `Delete`
- `Close`
- `Reopen`
- `Archive`
- `Restore`

If the Operation Mode is missing, unclear, or unsupported, stop and report the problem.

## Execution Mode

Specify one of the following modes:

- `Draft Only`
- `Apply After Approval`

If the Execution Mode is missing, unclear, or unsupported, use `Draft Only`.

Under `Draft Only`, never perform any GitHub write operation.

## Source of Truth

Use the following sources in priority order:

1. Human request and explicit approvals
2. Verified GitHub repository state
3. Verified GitHub Project state
4. Approved planning documents or prompts

Do not invent GitHub state or requested changes.

## Inputs

- Operation Mode: `{{OPERATION_MODE}}`
- Execution Mode: `{{EXECUTION_MODE}}`
- Target Repository: `{{TARGET_REPOSITORY}}`
- Resource: `{{RESOURCE}}`
- Items: `{{ITEMS}}`
- Additional Instructions: `{{ADDITIONAL_INSTRUCTIONS}}`

## Supported Resources

The Resource may be one or more of the following:

- Issue
- Pull Request
- Project
- Project Item
- Project Field
- Milestone
- Label
- Branch
- Release
- Discussion

Unknown resources must not be inferred.

## Workflow

1. Validate the requested operation.
2. Read the current GitHub state when necessary.
3. Verify that every target exists when required.
4. Present the proposed operation.
5. Under `Draft Only`, stop after presenting the proposal.
6. Under `Apply After Approval`, wait for explicit Human approval.
7. Immediately before execution, re-read the affected GitHub state if correctness depends on the current state.
8. Execute only the approved operations.
9. Verify the resulting GitHub state.
10. Report the verified result.

## Batch Operations

Multiple resources may be processed within a single execution.

Each item shall be processed independently.

Supported examples include:

- Creating multiple Issues
- Updating multiple Issues
- Updating multiple Project Fields
- Creating multiple Milestones
- Closing multiple Issues
- Reopening multiple Pull Requests

Failure of one item must not automatically cancel unrelated approved items unless requested by the Human.

## Approval Rules

- Tool availability does not constitute Human approval.
- Authentication does not constitute Human approval.
- Previous approval must not be reused.
- Every write operation requires explicit Human approval.
- If the proposed operation changes after approval, obtain approval again.

## Validation Rules

Before executing:

- Verify target resources.
- Verify repository.
- Verify duplicate creation when applicable.
- Verify conflicting operations.
- Verify required identifiers.

Do not guess missing identifiers.

## Partial Approval

When multiple items are proposed:

- Respect approvals on an item-by-item basis.
- Skip rejected items.
- Clearly report skipped items.

## Retry Safety

Before retrying:

- Verify whether the requested operation has already been completed.
- Do not duplicate resources.
- Do not perform the same update twice unless explicitly requested.

## Capability Fallback

If GitHub read capability is unavailable:

- State which verification could not be completed.
- Do not assume repository state.

If GitHub write capability is unavailable:

- Produce a complete execution plan.
- Do not claim that any GitHub state changed.

If authentication or permissions are insufficient:

- Stop the operation.
- Report the missing capability.
- Do not broaden repository permissions.

## Character and Output Size Limits

Prefer returning the complete result directly.

If a character limit, message-size limit, terminal limit, tool limit, or output truncation risk prevents returning the complete result:

1. Write the complete output to a Markdown (`.md`) file.
2. Do not omit information solely to fit the limit.
3. Return the file path or artifact reference.
4. Clearly state that the complete output was written to the file.
5. Do not claim that a file was created unless its existence was verified.

## Output

### Operation Summary

- Operation Mode: `{{RESOLVED_OPERATION_MODE}}`
- Execution Mode: `{{RESOLVED_EXECUTION_MODE}}`
- Repository: `{{TARGET_REPOSITORY}}`
- Resource: `{{RESOURCE}}`

### Proposed Operations

{{PROPOSED_OPERATIONS}}

### Approved Items

{{APPROVED_ITEMS}}

### Execution Result

{{EXECUTION_RESULT}}

### Verification

{{VERIFICATION}}

### Item Results

| Item | Operation | Status | Verification |
|------|-----------|--------|--------------|
| {{ITEM}} | {{OPERATION}} | {{STATUS}} | {{VERIFICATION}} |
