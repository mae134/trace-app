#!/usr/bin/env bash

# Title見出し直後の最初の非空行を取得する
extract_pull_request_title() {
  local draft_file="$1"

  awk '
    $0 == "# Title" { in_title = 1; next }
    in_title && /^# / { exit }
    in_title && $0 !~ /^[[:space:]]*$/ { print; exit }
  ' "$draft_file"
}

# Title見出しとタイトル行を除いた残りの内容をPull Request本文として取得する
extract_pull_request_body() {
  local draft_file="$1"

  awk '
    title_read { print }
    in_title && $0 !~ /^[[:space:]]*$/ { title_read = 1; next }
    $0 == "# Title" { in_title = 1; next }
  ' "$draft_file"
}

# 空白文字以外を含む場合に成功を返す
has_non_whitespace_content() {
  local content="$1"

  [[ "$content" =~ [^[:space:]] ]]
}
