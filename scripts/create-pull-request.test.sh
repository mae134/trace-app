#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_UNDER_TEST="$SCRIPT_DIR/create-pull-request.sh"
TEST_ROOT="$(mktemp -d)"
TEST_COUNT=0

cleanup() {
  rm -rf "$TEST_ROOT"
}
trap cleanup EXIT

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

assert_contains() {
  local actual="$1"
  local expected="$2"

  [[ "$actual" == *"$expected"* ]] || fail "expected output to contain: $expected"
}

assert_log_contains() {
  local expected="$1"

  grep -F -- "$expected" "$TEST_COMMAND_LOG" >/dev/null ||
    fail "expected command log to contain: $expected"
}

assert_log_excludes() {
  local unexpected="$1"

  if grep -F -- "$unexpected" "$TEST_COMMAND_LOG" >/dev/null; then
    fail "expected command log not to contain: $unexpected"
  fi
}

write_valid_draft() {
  local draft_file="$1"

  cat >"$draft_file" <<'EOF'
# Title

feat: テスト用Pull Request

## Summary

テスト本文です。

## Verification

- テスト成功
EOF
}

setup_case() {
  TEST_COUNT=$((TEST_COUNT + 1))
  CASE_DIR="$TEST_ROOT/case-$TEST_COUNT"
  MOCK_BIN="$CASE_DIR/bin"
  TEST_REPOSITORY_ROOT="$CASE_DIR/repository"
  TEST_DRAFT_FILE="$CASE_DIR/reviewed-pr-draft.md"
  TEST_COMMAND_LOG="$CASE_DIR/commands.log"
  TEST_CAPTURED_BODY="$CASE_DIR/captured-body.md"
  TEST_BODY_PATH_RECORD="$CASE_DIR/body-path"
  TEST_HEAD_BRANCH="feature/60-create-pr-from-draft"
  TEST_AUTH_STATUS="success"
  TEST_DUPLICATE_COUNT="0"
  TEST_CREATE_STATUS="success"
  mkdir -p "$MOCK_BIN" "$TEST_REPOSITORY_ROOT"
  : >"$TEST_COMMAND_LOG"

  export TEST_REPOSITORY_ROOT TEST_COMMAND_LOG TEST_CAPTURED_BODY
  export TEST_BODY_PATH_RECORD TEST_HEAD_BRANCH TEST_AUTH_STATUS TEST_DUPLICATE_COUNT
  export TEST_CREATE_STATUS

  cat >"$MOCK_BIN/git" <<'EOF'
#!/bin/bash
set -u
printf 'git %s\n' "$*" >>"$TEST_COMMAND_LOG"

case "${1:-} ${2:-}" in
  "rev-parse --is-inside-work-tree") exit 0 ;;
  "rev-parse --show-toplevel") printf '%s\n' "$TEST_REPOSITORY_ROOT" ;;
  "branch --show-current") printf '%s\n' "$TEST_HEAD_BRANCH" ;;
  "check-ref-format --branch")
    /usr/bin/git check-ref-format --branch "${3:-}" >/dev/null 2>&1
    ;;
  "ls-remote --exit-code")
    [[ "${5:-}" != "${TEST_MISSING_REMOTE_BRANCH:-}" ]]
    ;;
  *) exit 1 ;;
esac
EOF

  cat >"$MOCK_BIN/gh" <<'EOF'
#!/bin/bash
set -u
printf 'gh %s\n' "$*" >>"$TEST_COMMAND_LOG"

if [[ "${1:-} ${2:-}" == "auth status" ]]; then
  [[ "$TEST_AUTH_STATUS" == "success" ]]
  exit
fi

if [[ "${1:-} ${2:-}" == "pr list" ]]; then
  printf '%s\n' "$TEST_DUPLICATE_COUNT"
  exit 0
fi

if [[ "${1:-} ${2:-}" == "pr create" ]]; then
  body_file=""
  shift 2
  while [[ $# -gt 0 ]]; do
    if [[ "$1" == "--body-file" ]]; then
      body_file="$2"
      break
    fi
    shift
  done
  [[ -n "$body_file" ]] || exit 2
  printf '%s\n' "$body_file" >"$TEST_BODY_PATH_RECORD"
  cp "$body_file" "$TEST_CAPTURED_BODY"
  [[ "$TEST_CREATE_STATUS" == "success" ]] || exit 2
  printf '%s\n' 'https://github.com/example/trace-app/pull/60'
  exit 0
fi

exit 1
EOF

  chmod +x "$MOCK_BIN/git" "$MOCK_BIN/gh"
}

run_cli() {
  local input="$1"
  shift

  set +e
  CLI_OUTPUT="$(printf '%s' "$input" | PATH="$MOCK_BIN:/usr/bin:/bin" /bin/bash "$SCRIPT_UNDER_TEST" "$@" 2>&1)"
  CLI_STATUS=$?
  set -e
}

# Normal execution uses the explicitly provided temporary draft and branch defaults.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
run_cli $'y\n' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -eq 0 ]] || fail "normal execution exited with $CLI_STATUS"
assert_contains "$CLI_OUTPUT" "Pull Request created:"
assert_contains "$CLI_OUTPUT" "https://github.com/example/trace-app/pull/60"
assert_log_contains "gh pr create --base dev --head feature/60-create-pr-from-draft --title feat: テスト用Pull Request --body-file"
assert_contains "$(cat "$TEST_CAPTURED_BODY")" "## Summary"
body_path="$(cat "$TEST_BODY_PATH_RECORD")"
[[ ! -e "$body_path" ]] || fail "temporary body file was not removed"

# Missing explicit draft fails before GitHub authentication or PR operations.
setup_case
run_cli '' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -ne 0 ]] || fail "missing draft unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "Error: Pull Request Draft was not found:"
assert_log_excludes "gh auth status"

# Omitting --draft is rejected instead of resolving a repository path.
setup_case
run_cli '' 60
[[ $CLI_STATUS -ne 0 ]] || fail "missing --draft unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "A temporary Pull Request Draft must be specified with --draft."
assert_log_excludes "gh auth status"

# A draft with an empty Body section is rejected.
setup_case
cat >"$TEST_DRAFT_FILE" <<'EOF'
# Title

feat: 本文なし
EOF
run_cli '' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -ne 0 ]] || fail "empty body unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "must contain a non-empty body after the title"
assert_log_excludes "gh auth status"

# A malformed draft without a Title section is rejected.
setup_case
cat >"$TEST_DRAFT_FILE" <<'EOF'
## Body

本文
EOF
run_cli '' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -ne 0 ]] || fail "invalid draft unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "must contain a non-empty '# Title' section"
assert_log_excludes "gh auth status"

# Missing GitHub CLI is reported clearly.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
mv "$MOCK_BIN/gh" "$CASE_DIR/gh-disabled"
ln -s /usr/bin/dirname "$MOCK_BIN/dirname"
set +e
CLI_OUTPUT="$(PATH="$MOCK_BIN" /bin/bash "$SCRIPT_UNDER_TEST" 60 --draft "$TEST_DRAFT_FILE" 2>&1)"
CLI_STATUS=$?
set -e
[[ $CLI_STATUS -ne 0 ]] || fail "missing GitHub CLI unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "Error: GitHub CLI (gh) is not installed."

# Missing authentication prevents duplicate checks and creation.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
export TEST_AUTH_STATUS=failure
run_cli '' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -ne 0 ]] || fail "missing authentication unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "Error: GitHub CLI is not authenticated."
assert_log_excludes "gh pr list"
assert_log_excludes "gh pr create"

# An existing open Pull Request prevents creation.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
export TEST_DUPLICATE_COUNT=1
run_cli '' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -ne 0 ]] || fail "duplicate Pull Request unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "An open Pull Request already exists"
assert_log_excludes "gh pr create"

# Base and head overrides are passed to GitHub CLI.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
run_cli $'Y\n' 60 --draft "$TEST_DRAFT_FILE" --base release --head feature/60-override
[[ $CLI_STATUS -eq 0 ]] || fail "branch override flow exited with $CLI_STATUS"
assert_contains "$CLI_OUTPUT" "Base: release"
assert_contains "$CLI_OUTPUT" "Head: feature/60-override"
assert_log_contains "gh pr create --base release --head feature/60-override"

# A relative explicit draft path is accepted with an Issue number.
setup_case
explicit_draft="reviewed-draft.md"
write_valid_draft "$CASE_DIR/$explicit_draft"
set +e
CLI_OUTPUT="$(cd "$CASE_DIR" && printf 'y\n' | PATH="$MOCK_BIN:/usr/bin:/bin" /bin/bash "$SCRIPT_UNDER_TEST" 60 --draft "$explicit_draft" 2>&1)"
CLI_STATUS=$?
set -e
[[ $CLI_STATUS -eq 0 ]] || fail "explicit draft flow exited with $CLI_STATUS"
assert_contains "$CLI_OUTPUT" "Draft: $CASE_DIR/$explicit_draft"

# Human cancellation never creates a Pull Request or temporary body file.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
run_cli $'n\n' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -eq 0 ]] || fail "cancellation exited with $CLI_STATUS"
assert_contains "$CLI_OUTPUT" "Pull Request creation canceled."
assert_log_excludes "gh pr create"
[[ ! -e "$TEST_BODY_PATH_RECORD" ]] || fail "cancellation created a temporary body file"

# A GitHub creation failure also removes the temporary body file.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
export TEST_CREATE_STATUS=failure
run_cli $'y\n' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -ne 0 ]] || fail "GitHub creation failure unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "Error: Failed to create the Pull Request."
body_path="$(cat "$TEST_BODY_PATH_RECORD")"
[[ ! -e "$body_path" ]] || fail "failed creation left the temporary body file"

# Protected heads are rejected before GitHub operations.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
export TEST_HEAD_BRANCH=dev
run_cli '' 60 --draft "$TEST_DRAFT_FILE"
[[ $CLI_STATUS -ne 0 ]] || fail "protected head unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "Pull Requests cannot be created from protected branch 'dev'."
assert_log_excludes "gh auth status"

# Identical base and head branches are rejected.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
run_cli '' 60 --draft "$TEST_DRAFT_FILE" --base feature/same --head feature/same
[[ $CLI_STATUS -ne 0 ]] || fail "identical branches unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "Base and head branches must be different."
assert_log_excludes "gh auth status"

# An unpushed head branch is rejected.
setup_case
write_valid_draft "$TEST_DRAFT_FILE"
export TEST_MISSING_REMOTE_BRANCH=feature/60-create-pr-from-draft
run_cli '' 60 --draft "$TEST_DRAFT_FILE"
unset TEST_MISSING_REMOTE_BRANCH
[[ $CLI_STATUS -ne 0 ]] || fail "missing remote head unexpectedly succeeded"
assert_contains "$CLI_OUTPUT" "Push it before creating a Pull Request."
assert_log_excludes "gh auth status"

printf 'PASS: %d create-pull-request tests\n' "$TEST_COUNT"
