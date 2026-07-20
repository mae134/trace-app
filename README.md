# Trace App

Trace Appは、基本情報技術者試験の科目Bにおけるトレース問題を効率よく学習するためのWebアプリケーションです。

ユーザーが「どこでつまずいたのか」を可視化し、苦手傾向を分析することで、段階的な学習改善を支援することを目的としています。

---

## プロジェクトの目標

- 科目Bのトレース学習を効率化する
- トレースミスや苦手傾向を可視化する
- 学習データを分析し、継続的な成長を支援する
- 実践的なWebアプリケーション開発を通してフルスタック開発スキルを習得する
- AI支援開発ワークフローを活用した開発プロセスを確立する

---

## ドキュメント

| ドキュメント | 説明 |
|----------|-------------|
| `docs/playbook/` | 開発ワークフローと運用ガイドライン |
| `docs/checklists/` | 開発工程および作業再開時のチェックリスト |
| `docs/adr/` | Architecture Decision Records |
| `docs/design/` | Approved Design文書 |
| `docs/prompts/` | AIアシスタント向けプロンプトテンプレート |
| `docs/history/` | ワークフローの改善履歴 |

---

## AIワークフロー概要

- **Human**はプロダクトオーナーとして要件定義、GitHub Issueの承認、レビュー、Pull RequestのMergeを担当します。
- **ChatGPT**は設計支援、レビュー、ワークフロー改善、プロンプト作成を支援します。
- **AI coding agent**は承認済みの設計とGitHub Issueに基づいて実装・検証を行います。
- 必要に応じてAI Contextや関連ドキュメントを更新します。

---

## ブランチ戦略

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

## リポジトリ構成

| パス | 用途 |
|------|---------|
| `app/` | Next.js App Router |
| `components/` | UIコンポーネント |
| `lib/` | 共通処理・ユーティリティ |
| `public/` | 静的ファイル |
| `.ai/` | AI向け共有プロジェクトコンテキスト |
| `.github/` | GitHubテンプレート・ワークフロー |
| `docs/` | Playbook、ADR、Design、プロンプト、履歴など |
| `scripts/` | 開発で使用するスクリプト |

リポジトリ構成の詳細を確認するには、リポジトリのルートディレクトリで `tree` コマンドを実行してください。

#### `tree` コマンドがインストールされていない場合

Ubuntu / WSL

```bash
sudo apt install tree
```

macOS (Homebrew)

```bash
brew install tree
```

※ Windows（PowerShell / コマンドプロンプト）では `tree` コマンドを標準で利用できます。

---

## 開発環境のセットアップ

### 必要要件

- Node.js 20.9以降
- npm

### インストール

```bash
npm install
```

### 起動

```bash
npm run dev
```

<http://localhost:3000> を開きます。

---

## npmコマンド

| コマンド | 説明 |
|----------|------|
| `npm run dev` | 開発サーバーを起動 |
| `npm run build` | 本番ビルドを作成 |
| `npm run start` | 本番ビルドを起動 |
| `npm run lint` | ESLintを実行 |

## 利用可能なスクリプト

`scripts/` ディレクトリには、Git運用や開発を支援するスクリプトを配置します。

### create-issue-branch.sh

GitHub Issue に紐付いた作業ブランチを `dev` ブランチから作成します。

#### 前提条件

- Git がインストールされている
- GitHub CLI (`gh`) がインストールされている
- GitHub CLI にログイン済み (`gh auth login`)

#### 初回のみ

実行権限を付与します。（Git Bash / WSL）

```bash
chmod +x scripts/create-issue-branch.sh
```

※ PowerShell のみで利用する場合は不要です。

#### 使い方

```bash
./scripts/create-issue-branch.sh <issue-number> <branch-name>
```

#### 使用例

```bash
./scripts/create-issue-branch.sh 4 chore/setup-ci-code-quality
./scripts/create-issue-branch.sh 5 feature/add-login
./scripts/create-issue-branch.sh 6 feature/trace-analysis
./scripts/create-issue-branch.sh 7 fix/login-validation
./scripts/create-issue-branch.sh 8 docs/update-readme
```

#### 引数

| 引数 | 説明 | 例 |
|------|------|-----|
| issue-number | GitHub Issue番号 | `4` |
| branch-name | 作成するブランチ名 | `chore/setup-ci-code-quality` |

#### 実行内容

以下の処理を自動化し、安全にIssue対応ブランチを作成します。

1. 引数を検証
2. Git / GitHub CLI の存在確認
3. Gitリポジトリ内で実行されているか確認
4. 未コミット変更がないか確認
5. Issueの存在確認
6. ローカル・リモートのブランチ重複確認
7. `dev` ブランチへ切り替え
8. `dev` を最新状態へ更新
9. Issueに紐付いたブランチを作成
10. ブランチへ切り替え
11. リモート追跡ブランチ（upstream）を設定

#### 注意事項

- 作業ツリーに未コミットの変更がある場合は実行できません。
- `dev` ブランチを最新化してから作業ブランチを作成します。
- 同名のローカル・リモートブランチが存在する場合はエラーになります。

---

## 開発フロー

1. GitHub Issue
2. Approved Design
3. Implementation Prompt
4. AI coding agentによる実装
5. Repository Documentation Review（必要に応じて）
6. AI Context Update（必要に応じて）
7. Review
8. Commit
9. Pull Request Draft
10. Pull Request
11. Merge

---

## ドキュメント作成ガイドライン

- この `README.md` は日本語で記述します。
- READMEの新規・変更内容は原則として日本語で記述します。
- ファイル名、ディレクトリ名、コマンド、コード、識別子、技術固有名詞は必要に応じて英語のまま維持します。
- READMEは簡潔に保ち、プロジェクトの目的と利用方法を分かりやすく記述します。