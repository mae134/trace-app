#!/usr/bin/env bash

# エラー発生時に即終了し、未定義変数やパイプラインのエラーも検知する
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=scripts/lib/branch-name.sh
source "$SCRIPT_DIR/lib/branch-name.sh"
# shellcheck source=scripts/lib/pull-request-draft.sh
source "$SCRIPT_DIR/lib/pull-request-draft.sh"

DEFAULT_BASE_BRANCH="dev"
REMOTE="origin"

usage() {
  cat <<EOF
Usage: $0 <issue-number> --draft <file> [--base <branch>] [--head <branch>]

Create a GitHub Pull Request from a reviewed Pull Request Draft.

Options:
  --draft <file>   Use an explicit temporary Pull Request Draft file.
  --base <branch>  Set the base branch (default: dev).
  --head <branch>  Set the head branch (default: current branch).
  --help           Show this help message.
EOF
}

error() {
  printf 'Error: %s\n' "$1" >&2
}

ISSUE_NUMBER=""
DRAFT_FILE=""
BASE_BRANCH="$DEFAULT_BASE_BRANCH"
HEAD_BRANCH=""
BODY_FILE=""

cleanup() {
  if [[ -n "$BODY_FILE" && -f "$BODY_FILE" ]]; then
    rm -f -- "$BODY_FILE"
  fi
}
trap cleanup EXIT

while [[ $# -gt 0 ]]; do
  case "$1" in
    --draft | --base | --head)
      option="$1"
      if [[ $# -lt 2 || -z "$2" ]]; then
        error "Option '$option' requires a value."
        usage >&2
        exit 1
      fi

      case "$option" in
        --draft) DRAFT_FILE="$2" ;;
        --base) BASE_BRANCH="$2" ;;
        --head) HEAD_BRANCH="$2" ;;
      esac
      shift 2
      ;;
    --help)
      usage
      exit 0
      ;;
    --*)
      error "Unknown option: $1"
      usage >&2
      exit 1
      ;;
    *)
      if [[ -n "$ISSUE_NUMBER" ]]; then
        error "Only one Issue number may be specified."
        usage >&2
        exit 1
      fi
      ISSUE_NUMBER="$1"
      shift
      ;;
  esac
done

if [[ -z "$ISSUE_NUMBER" ]]; then
  error "An Issue number is required."
  usage >&2
  exit 1
fi

if [[ ! "$ISSUE_NUMBER" =~ ^[1-9][0-9]*$ ]]; then
  error "Invalid Issue number: $ISSUE_NUMBER"
  exit 1
fi

if [[ -z "$DRAFT_FILE" ]]; then
  error "A temporary Pull Request Draft must be specified with --draft."
  usage >&2
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  error "git is not installed."
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  error "GitHub CLI (gh) is not installed."
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  error "Not inside a Git repository."
  exit 1
fi

if [[ "$DRAFT_FILE" != /* ]]; then
  DRAFT_FILE="$(pwd)/$DRAFT_FILE"
fi

if [[ ! -f "$DRAFT_FILE" ]]; then
  error "Pull Request Draft was not found: $DRAFT_FILE"
  exit 1
fi

PR_TITLE="$(extract_pull_request_title "$DRAFT_FILE")"
PR_BODY="$(extract_pull_request_body "$DRAFT_FILE")"

if [[ -z "$PR_TITLE" ]]; then
  error "Pull Request Draft must contain a non-empty '# Title' section."
  exit 1
fi

if ! has_non_whitespace_content "$PR_BODY"; then
  error "Pull Request Draft must contain a non-empty body after the title."
  exit 1
fi

if [[ -z "$HEAD_BRANCH" ]]; then
  HEAD_BRANCH="$(git branch --show-current)"
fi

if [[ -z "$HEAD_BRANCH" ]]; then
  error "Unable to resolve the head branch from a detached HEAD."
  exit 1
fi

if ! is_valid_branch_name "$BASE_BRANCH"; then
  error "Invalid base branch: $BASE_BRANCH"
  exit 1
fi

if ! is_valid_branch_name "$HEAD_BRANCH"; then
  error "Invalid head branch: $HEAD_BRANCH"
  exit 1
fi

if [[ "$HEAD_BRANCH" == "main" || "$HEAD_BRANCH" == "dev" ]]; then
  error "Pull Requests cannot be created from protected branch '$HEAD_BRANCH'."
  exit 1
fi

if [[ "$BASE_BRANCH" == "$HEAD_BRANCH" ]]; then
  error "Base and head branches must be different."
  exit 1
fi

if ! git ls-remote --exit-code --heads "$REMOTE" "$BASE_BRANCH" >/dev/null 2>&1; then
  error "Base branch '$REMOTE/$BASE_BRANCH' was not found."
  exit 1
fi

if ! git ls-remote --exit-code --heads "$REMOTE" "$HEAD_BRANCH" >/dev/null 2>&1; then
  error "Head branch '$REMOTE/$HEAD_BRANCH' was not found. Push it before creating a Pull Request."
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  error "GitHub CLI is not authenticated. Run 'gh auth login' first."
  exit 1
fi

if ! EXISTING_PR_COUNT="$(gh pr list --head "$HEAD_BRANCH" --state open --json number --jq 'length' 2>/dev/null)"; then
  error "Failed to check for an existing Pull Request."
  exit 1
fi

if [[ ! "$EXISTING_PR_COUNT" =~ ^[0-9]+$ ]]; then
  error "GitHub CLI returned an invalid Pull Request count."
  exit 1
fi

if ((EXISTING_PR_COUNT > 0)); then
  error "An open Pull Request already exists for head branch '$HEAD_BRANCH'."
  exit 1
fi

echo
echo "Pull Request preview:"
echo "  Title: $PR_TITLE"
echo "  Base: $BASE_BRANCH"
echo "  Head: $HEAD_BRANCH"
echo "  Draft: $DRAFT_FILE"
echo
echo "Body:"
printf '%s\n' "$PR_BODY"
echo
printf 'Create this Pull Request? [y/N] '

if ! IFS= read -r confirmation || [[ ! "$confirmation" =~ ^[Yy]$ ]]; then
  echo
  echo "Pull Request creation canceled."
  exit 0
fi

BODY_FILE="$(mktemp)"
printf '%s\n' "$PR_BODY" >"$BODY_FILE"

if ! PR_URL="$(gh pr create \
  --base "$BASE_BRANCH" \
  --head "$HEAD_BRANCH" \
  --title "$PR_TITLE" \
  --body-file "$BODY_FILE")"; then
  error "Failed to create the Pull Request."
  exit 1
fi

echo
echo "Pull Request created:"
echo "$PR_URL"
