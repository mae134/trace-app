# AI Development Playbook v1.2

# このドキュメントの役割

このドキュメントは、人間がAIと効率的に開発を進めるための知識ベースである。

ChatGPTとの議論で採用した運用ルール・開発方針・改善案を蓄積し、今後のプロジェクトでも再利用できることを目的とする。

Codexへ直接渡すことは目的としない。

Codexへ指示する際は、このドキュメントを参考にChatGPTがプロンプトを作成する。

---

# プロジェクトロードマップ（Project Roadmap）

## Phase 1

**codex-playground**

目的

- Codexの操作に慣れる
- AIとの開発フローを確立する
- 実務に近い開発体験を行う

完成条件

- AGENTS.md運用
- Issue運用
- Git運用
- ブランチ運用
- PRレビュー体験
- メモアプリ完成

---

## Phase 2

**Trace App**

Playgroundで確立した開発フローを本番へ適用する。

---

# チーム構成（Team Structure）

## Human

### 役割

- Product Owner
- Tech Lead

### 責務

- プロダクトの方向性を決める
- 要件定義
- 設計を決定する
- Issue承認
- 最終レビュー
- GitへPushする
- Mergeする

---

## ChatGPT

### 役割

- Architect
- Mentor

### 責務

- 設計提案
- レビュー
- 開発フロー改善
- AI運用改善
- 技術相談

---

## Codex

### 役割

- Developer

### 責務

- GitHub Issueに従って実装する
- 承認済みの設計（Approved Design）に従って実装する
- コードを変更する前に、実装アプローチ・変更予定ファイル・前提条件を報告する
- テスト・動作確認を行う
- Pull Request本文のドラフトを作成する
- 実装内容を説明する
- Execution Logを出力する

### 行わないこと

- ブランチを作成・切り替えない
- コミットしない（明示的な指示がある場合を除く）
- Pull Requestを作成しない
- Mergeしない
- 承認済みの設計（Approved Design）を変更しない

---

# 開発理念

人間が意思決定を行う。

プロダクトの方向性や最終判断は人間が行い、
AIは実装・レビュー・提案を通じて開発を支援する。

---

# 開発フロー

### 開発フロー概要

Idea
↓
GitHub Issue
↓
Approved Design
↓
Implementation Prompt
↓
Codex
↓
Review
↓
Repository Documentation Review（if needed）
↓
AI Context Update（if needed）
↓
History（if needed）
↓
Commit
↓
Push
↓
Pull Request
↓
Merge

### 開発手順

1. アイデアを考える
2. GitHub Issueを作成する（Human + ChatGPT）
3. GitHub Issueをレビュー・承認する
4. ブランチを作成する
5. 設計案（Approved Design）を作成する（Human + ChatGPT）
6. 設計レビューを行う
7. Codex用実装プロンプトを作成する（ChatGPT）
8. 実装前チェックリストを確認する
9. Codexへ実装を依頼する
10. 実装レビューを行う
11. 必要に応じて差し戻し・再実装する
12. 最終レビューを行う
13. Repository Documentation更新要否を確認する（必要に応じて）
14. AI Contextを更新する（必要に応じて）
15. Historyを更新する（必要に応じて）
16. コミットする
17. プッシュする
18. Pull Request本文のドラフトを作成する
19. ドラフトをレビューする
20. Pull Requestを作成する
21. マージする

※ Playgroundでは、本番導入前の開発フローを検証する。

Trace Appでは、Playgroundで確立した開発フローを適用する。

### Issueレビュー

以下の内容を確認する。

- 目的（Goal）
- 実装範囲（Scope）
- 実装しない範囲（Out of Scope）
- 完了条件（Acceptance Criteria）

### 実装レビュー

以下の内容を確認する。

- 実装内容
- 品質
- Issueとの一致

## ブランチ命名規則

用途に応じて以下のプレフィックスを使用する。

- feature/ : 新機能
- docs/ : ドキュメント・運用改善
- fix/ : バグ修正
- refactor/ : 振る舞いを変えないリファクタリング
- chore/ : 保守・メンテナンス

---

# Issue運用ルール

GitHub Issueは「何を実装するか（What）」を定義する。

実装方法（How）はGitHub Issueへ記載せず、Approved Designで管理する。

## 運用ルール

- Humanが最終承認する
- Scopeは小さく保つ
- One Issue = One Feature
- GitHub Issueには要件のみを記載する
- 設計内容はApproved Designで管理する

実装プロンプトは、GitHub Issue・Approved Design・プロンプトテンプレートを基にChatGPTが作成する。

### 使用するテンプレート

- `issue-prompt-template.md`
  - ChatGPTでGitHub Issueを作成するためのテンプレート

- `codex-implementation-prompt-template.md`
  - Codexへ実装を依頼するためのテンプレート

- `approved-design-prompt-template.md`
  - Approved Designを作成するためのテンプレート

- `pull-request-draft-prompt-template.md`
  - Pull Request本文のドラフトを生成するためのテンプレート

- `generate-ai-handoff-prompt-template.md`
  - AI間の引き継ぎプロンプトを生成するためのテンプレート

- `update-ai-context-incremental-prompt-template.md`
  - Issue完了後に `.ai/` のコンテキストを差分更新するためのテンプレート

- `rebuild-ai-context-prompt-template.md`
  - 現在のリポジトリ状態から `.ai/` のコンテキストを再構築するためのテンプレート

- `generate-git-metadata-prompt-template.md`
  - Gitメタデータの要約を生成するためのテンプレート

- `repository-documentation-update-prompt-template.md`
  - 実装完了後にリポジトリ文書の更新要否を確認するためのテンプレート

- `repository-review-prompt-template.md`
  - 現在のリポジトリ状態を横断的にレビューするためのテンプレート

---

# Git運用

- main は常に安定した状態を保つ
- 1 Issue = 1 Branch
- 1 Branch = 1 Feature
- Merge前にレビューを行う
- Humanがブランチを作成する
- HumanがPushする
- HumanがMergeする
- Codexはブランチを作成・切り替えない
- Codexは明示的な指示がある場合を除き、コミットしない

---

# 開発チェックリスト

開発チェックリストは、現在の開発フェーズを確認し、安全に作業を再開するために使用する。

実装開始前およびPull Request作成前は、開発チェックリストに従って確認を行う。

開発チェックリストは `docs/checklists/` で管理する。

チェックリストの内容は、Historyで運用を十分に検証した後に更新する。

---

# コミット運用

Codexが実装

↓

Human + ChatGPTがレビュー

↓

必要に応じてCodexへ差し戻す

↓

必要に応じてHistoryを更新する

↓

Humanがコミット

↓

Humanがプッシュ

---

# Pull Request運用

Pull Request本文のドラフトは、変更内容を最も把握している担当者が、
実装内容・検証結果・GitHub Issueを基に作成する。

- 実装変更が中心の場合
  - Codexが作成する

- ドキュメント・運用変更が中心の場合
  - ChatGPTが作成する

1. 変更内容を最も把握している担当者がPull Request本文のドラフトを作成する
2. Humanがドラフトをレビューする
3. HumanがPull Requestを作成する
4. HumanがMergeする

### 使用するテンプレート

- `pull-request-draft-prompt-template.md`
  - Pull Request本文のドラフトを生成するためのテンプレート

---

# プロンプト作成ルール

Codexへ渡す実装プロンプトは、
GitHub Issue・Approved Design・プロンプトテンプレートを基にChatGPTが作成する。

プロンプトテンプレートは `docs/prompts/` で管理する。

実装プロンプトには、必要に応じて以下の内容を含める。

- 目的（Goal）
- 実装範囲（Scope）
- 制約事項（Constraints）
- 出力内容（Output）

テンプレートを更新する場合は、Historyで運用を十分に検証した後に反映する。

Codexへ渡す実装プロンプト本文は英語で記述する。

---

# AI Context運用

AI Contextは `.ai/` で管理し、AIがリポジトリの現在状態を把握するために使用する。

Issue完了後の差分更新には `update-ai-context-incremental-prompt-template.md` を使用する。

リポジトリ状態から再構築する場合は `rebuild-ai-context-prompt-template.md` を使用する。

Repository Documentation更新プロンプトでは `.ai/context.md` と `.ai/state.json` を更新しない。

---

# Repository Documentation運用

実装完了後は、必要に応じて `repository-documentation-update-prompt-template.md` を使用し、リポジトリ文書の更新要否を確認する。

更新対象は、実装内容によって直接影響を受けた文書に限定する。

プロジェクトルール・アーキテクチャ判断・コアワークフローは、GitHub IssueまたはApproved Designで明示的に要求された場合のみ更新する。

---

# AGENTS.md運用ルール

AGENTS.mdには

- AIが守るルール

を記載する。

人間向けの運用は、このドキュメントで管理する。

---

# 設計レビュー（Design Review）

Human + ChatGPTで作成した設計案を確認する。

問題がなければ、Codexへ実装を依頼する。

確認項目

- 目的（Goal）
- 実装範囲（Scope）
- 実装しない範囲（Out of Scope）
- 設計方針（Design Policy）
- コンポーネント構成（Component Structure）
- Props設計
- State管理（State Management）
- 型定義（Type Definitions）

---

# History運用

改善案はまずHistoryへ記録する。

改善案は実際のGitHub Issueで運用・検証した後に、
Playbook・Prompt・Checklistへ反映する。

Historyは運用改善の起点とし、十分に検証された改善のみを標準ルールとして採用する。

---

# 今後追加したいアイデア

- AGENTS.md Version管理
- GitHub Actions運用
- GitHub Projects運用
- PRテンプレート
- AIレビュー運用
- Review Checklist
- Issue Template
- Development Checklist improvements
- ADR運用ルール
- Claude Code運用

# ドキュメント構成と責務

このプロジェクトでは、各ドキュメントの責務を明確に分離する。

各ドキュメントは役割を分離し、それぞれが異なる責務を持つ。

Historyを起点として改善を行い、改善内容をPlaybook・Prompt・Checklistへ反映する。

```text
docs/
├── playbook/    … Human + ChatGPT が管理
├── checklists/  … 作業再開・工程確認用チェックリスト
├── adr/         … 設計判断を記録
├── prompts/     … ChatGPT・Codex用プロンプト
└── history/     … 改善履歴
```

Historyで学ぶ

↓

Playbookへ反映

↓

Prompt・Checklistへ反映

↓

Codexへ渡す

---

# 継続的改善（Continuous Improvement）

Historyで改善案を管理する。

改善案は実際のGitHub Issueで運用・検証した後に、
Playbook・Prompt・Checklistへ反映する。

---

# ディレクトリ構成

## docs/

### 目的

プロジェクト全体のドキュメントを管理する。

### 採用理由

ソースコードと運用情報を分離し、設計・運用・AIルールを管理するため。

---

## docs/playbook/

### 目的

AIとの開発フローや運用ルールを管理する。

### 採用理由

HumanとChatGPTが共通の開発方針を参照し、一貫した運用を行うため。

---

## docs/checklists/

### 目的

開発チェックリストを管理する。

### 採用理由

作業を中断した後でも現在の開発フェーズを確認し、安全に作業を再開できるようにするため。

---

## docs/adr/

### 目的

ADR（Architecture Decision Record：アーキテクチャ設計の意思決定記録）を管理する。

### 採用理由

「なぜこの設計を採用したのか」を後から説明できるようにするため。

### 例

- Next.js採用理由
- Supabase採用理由
- Server Action採用理由
- Route Handler採用理由

---

## docs/prompts/

### 目的

ChatGPT・Codexへ渡すプロンプトテンプレートを管理する。

### 採用理由

毎回ゼロから考えず、品質を一定に保つため。

---

## docs/history/

### 目的

ルール変更履歴を管理する。

### 採用理由

開発文化の成長を記録するため。

---

## AGENTS.md

### 目的

AI（Codex）が守るルールを管理する。

### 採用理由

毎回同じ説明をしなくて済むようにするため。

AI向けドキュメント。

---

## README.md

### 目的

プロジェクトの入口となるドキュメント。

### 採用理由

初めてプロジェクトを見る人が最初に読むため。

---

# 更新履歴

## v1.2

- GitHub Issue運用へ移行
- 開発フローを更新
- Codexの責務を更新
- Git運用を更新
- Issue運用を更新
- コミット運用を更新
- Pull Request運用を更新
- プロンプト作成ルールを更新
- プロンプトテンプレート一覧を更新
- AI Context運用を追加
- Repository Documentation運用を追加
- History運用を更新
- ドキュメント構成と責務を更新
- 開発チェックリスト運用を追加
- `docs/checklists/` を追加

## v1.1

- 開発フローを更新
- チーム体制を整理
- Pull Request運用を追加
- 設計レビューを追加
- History運用を追加
- 継続的改善の運用を追加
- ブランチ命名規則を追加

## v1.0

- 初版作成
- チーム体制決定
- Codex運用開始
- Playground運用開始
- AI Development Playbookを運用開始
