# プロンプト

このディレクトリには、ChatGPT、Codex、その他のAI assistantで使用するプロンプトテンプレートを保存します。

これらのテンプレートは、AIへの指示を標準化して一貫性を高め、高品質なAI支援開発ワークフローの維持に役立ちます。

---

# 目的

- AI assistantへの指示を標準化する
- タスクごとにプロンプトを一から作成することを避ける
- 一貫した開発ワークフローを維持する
- プロンプトの品質を継続的に改善する

---

# テンプレート

## `issue-prompt-template.md`

人間のレビュー用にGitHub Issueの説明を生成します。

## `codex-implementation-prompt-template.md`

Codex向けの実装プロンプトを生成します。

## `approved-design-prompt-template.md`

実装開始前にApproved Design文書を生成します。

## `pull-request-draft-prompt-template.md`

Pull Requestのドラフト説明を生成します。

## `generate-ai-handoff-prompt-template.md`

AI assistant間でプロジェクトコンテキストを引き継ぐためのAI引き継ぎ文書を生成します。

## `update-ai-context-incremental-prompt-template.md`

GitHub Issueの完了後に`.ai/`のプロジェクトコンテキストを差分更新します。

## `rebuild-ai-context-prompt-template.md`

現在のリポジトリ状態から`.ai/`のプロジェクトコンテキストを再構築します。

## `generate-git-metadata-prompt-template.md`

AI支援ワークフローの引き継ぎとレビュー用にGitメタデータの概要を生成します。

## `repository-documentation-update-prompt-template.md`

実装後にリポジトリドキュメントをレビューし、必要に応じて影響を受ける文書を更新します。

## `repository-review-prompt-template.md`

ファイルを変更せずに現在のリポジトリ状態をレビューします。

---

# ワークフロー

GitHub Issue
↓
Implementation Prompt
↓
Implementation
↓
Repository Documentation Review
↓
AI Context Update (if needed)
↓
Pull Request Draft

---

# ルール

- 可能な限り再利用できるようにプロンプトを設計します。
- プロンプト改善案は、採用前に`docs/history/`へ記録します。
- 改善内容を検証した後にのみ、プロンプトテンプレートを更新します。

---

# ドキュメント作成ガイドライン

- この`README.md`は日本語で記述します。
- READMEの新規および変更する内容は、原則として日本語で記述します。
- ファイル名、ディレクトリ名、コマンド、コード、識別子、技術固有名詞は必要に応じて英語のまま維持します。
- READMEは簡潔にし、そのディレクトリの目的に焦点を当てます。
