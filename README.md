# Codex Playground

Codex Playgroundは、ChatGPTとCodexを活用したAI支援開発ワークフローを構築し、検証するための学習プロジェクトです。

このプロジェクトの目標は、Issue駆動開発、Pull Requestワークフロー、人間とAIの明確な役割分担を実践し、最終的にTrace Appへ適用できる実用的な開発プロセスを確立することです。

---

# プロジェクトの目標

- AI支援開発ワークフローを確立する
- AI coding agentを使いこなせるようになる
- 実践的なGitワークフローを習得する
- メモアプリケーションを開発する
- 確立したワークフローをTrace Appへ適用する

---

# ドキュメント

| ドキュメント | 説明 |
|----------|-------------|
| `docs/playbook/` | 開発ワークフローと運用ガイドライン |
| `docs/checklists/` | 開発工程および作業再開時のチェックリスト |
| `docs/adr/` | Architecture Decision Records |
| `docs/design/` | Approved Design文書 |
| `docs/prompts/` | AIアシスタント向けプロンプトテンプレート |
| `docs/history/` | ワークフローの改善履歴 |

---

# AIワークフロー概要

- **Human**はプロジェクトの方向性を定め、GitHub Issueを承認し、最終レビュー、変更のPush、Pull RequestのMergeを行います。
- **ChatGPT**はアーキテクチャの議論、レビュー、ワークフロー改善、プロンプト生成を支援します。
- **AI coding agent**は、承認済みの設計に基づいて承認済みGitHub Issueを実装し、検証を行い、実装結果を報告します。
- 実装後、必要に応じてAI Contextと関連するリポジトリドキュメントを更新します。

---

# リポジトリ構成

| パス | 用途 |
|------|---------|
| `app/` | メモアプリケーションの実装 |
| `.ai/` | AI向け共有プロジェクトコンテキスト |
| `.github/` | GitHub Issueテンプレートとワークフロー |
| `docs/` | Playbook、チェックリスト、Approved Design、プロンプト、履歴、ADR |

---

# 開発環境のセットアップ

## 必要要件

- Node.js 20.9以降
- npm

## インストール

```bash
npm install
```

## 起動

```bash
npm run dev
```

<http://localhost:3000> を開きます。

---

# 利用可能なスクリプト

- `npm run dev`
- `npm run build`
- `npm run start`
- `npm run lint`

---

# 開発フロー

1. GitHub Issue
2. Approved Design
3. Implementation Prompt
4. Implementation
5. Repository Documentation Review (if needed)
6. AI Context Update (if needed)
7. Review
8. Commit
9. Pull Request Draft
10. Pull Request
11. Merge

---

# ドキュメント作成ガイドライン

- この`README.md`は日本語で記述します。
- READMEの新規および変更する内容は、原則として日本語で記述します。
- ファイル名、ディレクトリ名、コマンド、コード、識別子、技術固有名詞は必要に応じて英語のまま維持します。
- READMEは簡潔にし、そのディレクトリの目的に焦点を当てます。
