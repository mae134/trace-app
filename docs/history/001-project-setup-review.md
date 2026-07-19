# Issue001 Review

## Overview

Issue001（Project Setup）の実装を通して、
Codexとの開発フローを初めて実運用した。

Playbook・AGENTS.md・Issue・Prompt Templateを利用した開発は概ね期待通りに動作した。

---

# Good Points

## Scopeを守った

CodexはIssue外の既存変更を検知し、
対象外ファイルを変更しなかった。

例

- docs/playbook/ai-development-playbook.md は未変更のまま維持

---

## 実装前に状況を確認した

実装前に

- Git Status
- Node.js Version
- npm Version

を確認してから作業を開始した。

---

## Acceptance Criteriaを意識していた

Issueに記載した内容を満たすため、

- npm install
- npm run build
- npm run lint
- npm run dev
- curl

まで実施して動作確認を行った。

---

## レポートが分かりやすい

以下の形式で報告された。

- Summary
- Changed Files
- Commands Executed
- Verification Results
- Recommendations

レビューしやすかった。

---

# Improvement Points

## 検証がやや多かった

同じ目的のために

- npm run dev
- curl

を複数回実行していた。

必要最小限の検証で十分かもしれない。

---

## Scope判断

package.json の依存関係を
latest から固定バージョンへ変更した。

今回はProject Setupの範囲として許容したが、
今後はIssueに記載がない変更は
Recommendationとして提案する運用も検討する。

---

# Playbook Improvements

追加候補

- ブランチ作成手順
- 検証手順
- Review Checklist

---

# AGENTS.md Improvements

追加候補

- 必要最小限の検証を行う
- ブランチ操作はHumanが行う

---

# Prompt Template Improvements

IssueのScopeを参照するよう改善した。
