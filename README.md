# Trace App

Trace Appは、基本情報技術者試験の科目Bにおけるトレース問題を効率よく学習するためのWebアプリケーションです。

ユーザーが「どこでつまずいたのか」を可視化し、苦手傾向を分析することで、段階的な学習改善を支援することを目的としています。

---

# プロジェクトの目標

- 科目Bのトレース学習を効率化する
- トレースミスや苦手傾向を可視化する
- 学習データを分析し、継続的な成長を支援する
- 実践的なWebアプリケーション開発を通してフルスタック開発スキルを習得する
- AI支援開発ワークフローを活用した開発プロセスを確立する

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

- **Human**はプロダクトオーナーとして要件定義、GitHub Issueの承認、レビュー、Pull RequestのMergeを担当します。
- **ChatGPT**は設計支援、レビュー、ワークフロー改善、プロンプト作成を支援します。
- **AI coding agent**は承認済みの設計とGitHub Issueに基づいて実装・検証を行います。
- 必要に応じてAI Contextや関連ドキュメントを更新します。

---

# ブランチ戦略

このプロジェクトでは、開発ブランチとリリースブランチを分離したGitワークフローを採用します。

| ブランチ | 役割 |
|----------|------|
| `feature/*` | GitHub Issueごとの開発ブランチ |
| `dev` | 統合開発ブランチ（Staging環境へ継続的にデプロイ） |
| `main` | リリースブランチ（安定版のみをProduction環境へデプロイ） |

通常の開発は `feature/*` → `dev` の流れで進めます。

`main` には、安定したマイルストーンまたはリリース可能な状態になった時点で、Release Pull Requestを通してマージします。

```text
feature/*
      │
      ▼
Pull Request
      │
      ▼
     dev
      │
      ▼
Staging Deployment
      │
      ▼
Release Pull Request
      │
      ▼
    main
      │
      ▼
Production Deployment
```

---

# リポジトリ構成

| パス | 用途 |
|------|---------|
| `app/` | Next.js App Router |
| `components/` | UIコンポーネント |
| `lib/` | 共通処理・ユーティリティ |
| `public/` | 静的ファイル |
| `.ai/` | AI向け共有プロジェクトコンテキスト |
| `.github/` | GitHubテンプレート・ワークフロー |
| `docs/` | Playbook、ADR、Design、プロンプト、履歴など |

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
5. Repository Documentation Review（必要に応じて）
6. AI Context Update（必要に応じて）
7. Review
8. Commit
9. Pull Request Draft
10. Pull Request
11. Merge

---

# ドキュメント作成ガイドライン

- この `README.md` は日本語で記述します。
- READMEの新規・変更内容は原則として日本語で記述します。
- ファイル名、ディレクトリ名、コマンド、コード、識別子、技術固有名詞は必要に応じて英語のまま維持します。
- READMEは簡潔に保ち、プロジェクトの目的と利用方法を分かりやすく記述します。