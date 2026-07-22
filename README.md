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

| ドキュメント | 説明 | 基本言語 | 言語を選択する理由 |
|---|---|---|---|
| `README.md` | プロジェクト全体の概要、セットアップ、運用ルール | 日本語 | プロジェクトオーナーや開発者が日常的に確認する入口の文書であり、素早く理解・更新できることを優先するため |
| `docs/playbook/` | 開発ワークフローと運用ガイドライン | 日本語 | Humanが開発手順を確認し、判断や運用改善を行うための文書であり、レビューのしやすさを優先するため |
| `docs/checklists/` | 開発工程および作業再開時のチェックリスト | 日本語 | Humanが作業中に直接使用する文書であり、確認漏れを防ぎながら素早く読めることを優先するため |
| `docs/adr/` | Architecture Decision Records | 日本語 | アーキテクチャ上の判断理由をHumanが将来振り返り、比較・再検討できることを優先するため |
| `docs/design/approved/` | Humanが承認したApproved Design文書 | 英語 | AI Coding Agentが実装時に直接参照する正式な設計文書であり、人とAIの間で一貫した実装指示として利用するため |
| `docs/prompts/` | AIアシスタント向けプロンプトテンプレート | 用途に応じて日本語または英語 | Humanが入力・確認するテンプレートは日本語、AI Coding Agentへ直接渡すテンプレートは英語とし、それぞれの主な利用者に合わせるため |
| `docs/history/` | ワークフローや運用ルールの改善履歴 | 日本語 | Humanが変更の経緯や判断理由を振り返り、今後の改善に活用することを優先するため |
| `.ai/` | AI向け共有プロジェクトコンテキスト | 英語 | AI Coding Agentが継続的に参照する共有コンテキストであり、AI間で解釈を統一しやすくするため |

---

## ドキュメント言語ポリシー

このリポジトリでは、文書の主な利用者と用途に応じて日本語と英語を使い分けます。

### 日本語を使用する文書

Humanが主に作成、確認、レビュー、更新する文書は日本語で記述します。

対象例：

- `README.md`
- `docs/playbook/`
- `docs/checklists/`
- `docs/adr/`
- `docs/history/`
- Human向けのプロンプトテンプレート

日本語を使用する理由は、プロジェクトオーナーが内容を正確かつ素早く理解し、判断や修正を行いやすくするためです。

### 英語を使用する文書

AI Coding Agentが実装や検証の入力として直接参照する文書は英語で記述します。

対象例：

- `docs/design/approved/`
- AI Coding Agent向けのImplementation Prompt
- `.ai/` 配下の共有プロジェクトコンテキスト
- AI Coding Agentへ直接渡すその他の文書

英語を使用する理由は、AI支援開発で使用する指示・設計・共有コンテキストの表現を統一し、異なるAIツール間でも一貫して解釈しやすくするためです。

### 用途によって言語を分ける文書

`docs/prompts/` 配下の文書は、主な利用者によって言語を決定します。

- Humanが内容を入力、確認、承認するためのプロンプトは日本語
- AI Coding Agentへ直接渡し、実装や検証を依頼するプロンプトは英語
- HumanとAIの両方が利用する場合は、最終的な直接利用者を基準に決定する

同じ内容を日本語版と英語版の2ファイルで重複管理することは原則として避けます。重複による更新漏れや内容の不一致を防ぐため、各文書は主な用途に適した1つの言語で管理します。

ファイル名、ディレクトリ名、コマンド、コード、識別子、技術固有名詞は、本文の言語にかかわらず必要に応じて英語のまま維持します。

---

## AIワークフロー概要

- **Human**はプロダクトオーナーとして要件定義、GitHub Issueの承認、レビュー、Pull RequestのMergeを担当します。
- **ChatGPT**は設計支援、レビュー、ワークフロー改善、プロンプト作成を支援します。
- **AI Coding Agent**は承認済みの設計とGitHub Issueに基づいて実装・検証を行います。
- 必要に応じてAI Contextや関連ドキュメントを更新します。

---

## ブランチ戦略

このプロジェクトでは、開発ブランチとリリースブランチを分離したGitワークフローを採用します。

| ブランチ | 役割 |
|---|---|
| `feature/*` | GitHub Issueごとの機能開発ブランチ |
| `docs/*` | ドキュメント変更用ブランチ |
| `fix/*` | 不具合修正用ブランチ |
| `refactor/*` | リファクタリング用ブランチ |
| `chore/*` | 保守・設定変更用ブランチ |
| `dev` | 統合開発ブランチ（Staging環境へ継続的にデプロイ） |
| `main` | リリースブランチ（安定版のみをProduction環境へデプロイ） |

通常の開発は、Issueごとの作業ブランチから `dev` へPull Requestを作成して進めます。

`main` には、安定したマイルストーンまたはリリース可能な状態になった時点で、Release Pull Requestを通してマージします。

```text
Issue Branch
(feature/*, docs/*, fix/*, refactor/*, chore/*)
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

## Git運用

### GitHub Issueを起点とした開発フロー

GitHub Issueを作業の起点とし、Issueごとに専用ブランチを作成して開発を進めます。

```text
GitHub Issue
      │
      ▼
Determine Work Category
      │
      ▼
Create Issue Branch
      │
      ▼
Implementation
      │
      ▼
Review
      │
      ▼
Commit
      │
      ▼
Push
      │
      ▼
Pull Request
      │
      ▼
Merge
      │
      ▼
Finish Issue
```

ブランチ名のWork CategoryはGitHub Issueの目的を基準に決定します。

コミットメッセージとPull Requestタイトルは、実装後の変更内容と変更ファイルを確認して決定します。

ブランチ名、コミットメッセージ、Pull Requestタイトルでは、同じWork Categoryを使用します。

---

### Work Category

| Work Type | Branch Prefix | Commit / Pull Request Prefix |
|---|---|---|
| Feature | `feature/` | `feat:` |
| Documentation | `docs/` | `docs:` |
| Bug Fix | `fix/` | `fix:` |
| Refactoring | `refactor/` | `refactor:` |
| Maintenance | `chore/` | `chore:` |

Work Categoryが不明確な場合は、変更の中心となる目的を基準に判断します。

---

### ブランチ命名規則

Issueごとの作業ブランチは以下の形式で作成します。

```text
<type>/<issue-number>-<short-description>
```

#### ルール

- ブランチ名は英語で記述する
- lowercase kebab-caseを使用する
- GitHub Issue番号を含める
- 実装方法ではなくIssueの目的を簡潔に表す
- 選択したWork Categoryに対応するブランチプレフィックスを使用する

#### 例

```text
feature/42-add-authentication
docs/57-update-readme
fix/61-correct-login-validation
refactor/73-simplify-auth-service
chore/80-update-dependencies
```

---

### コミットメッセージ命名規則

コミットメッセージはConventional Commitsに従います。

```text
<type>: <summary>
```

#### ルール

- コミットメッセージは英語で記述する
- 実際にコミットへ含まれる変更内容を表す
- 命令形を基本とした簡潔な表現を使用する
- コミットされていない変更内容を記載しない
- ブランチ名と同じWork Categoryを使用する

#### 例

```text
feat: add authentication page
docs: update README
fix: correct login validation
refactor: simplify auth service
chore: update dependencies
```

---

### Pull Requestタイトル命名規則

Pull Requestタイトルは以下の形式で作成します。

```text
<type>: <summary>
```

#### ルール

- Summaryは日本語で記述する
- Prefixはブランチ名およびコミットメッセージと同じWork Categoryを使用する
- GitHub Issue全体の成果を簡潔に表す
- Pull Requestに複数の変更が含まれる場合は、単一のコミットメッセージをそのままコピーしない

#### 例

```text
feat: 認証画面を追加
docs: READMEにGit運用ルールを追加
fix: ログイン時の入力検証を修正
refactor: 認証サービスの構成を整理
chore: 依存パッケージを更新
```

---

## リポジトリ構成

| パス | 用途 |
|---|---|
| `app/` | Next.js App Router |
| `components/` | UIコンポーネント |
| `lib/` | 共通処理・ユーティリティ |
| `public/` | 静的ファイル |
| `.ai/` | AI向け共有プロジェクトコンテキスト |
| `.github/` | GitHubテンプレート・ワークフロー |
| `docs/playbook/` | 開発ワークフローと運用ガイドライン |
| `docs/checklists/` | 開発工程および作業再開時のチェックリスト |
| `docs/adr/` | Architecture Decision Records |
| `docs/design/approved/` | 承認済みのApproved Design文書 |
| `docs/prompts/` | AIアシスタント向けプロンプトテンプレート |
| `docs/history/` | ワークフローや運用ルールの改善履歴 |
| `scripts/` | 開発で使用するスクリプト |

リポジトリ構成の詳細を確認するには、リポジトリのルートディレクトリで `tree` コマンドを実行してください。

### `tree` コマンドがインストールされていない場合

Ubuntu / WSL

```bash
sudo apt install tree
```

macOS（Homebrew）

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
|---|---|
| `npm run dev` | 開発サーバーを起動 |
| `npm run build` | 本番ビルドを作成 |
| `npm run start` | 本番ビルドを起動 |
| `npm run lint` | ESLintを実行 |

---

## 利用可能なスクリプト

`scripts/` ディレクトリには、Git運用や開発を支援するスクリプトを配置します。

### create-issue-branch.sh

GitHub Issueに紐付いた作業ブランチを `dev` ブランチから作成します。

#### 前提条件

- Gitがインストールされている
- GitHub CLI（`gh`）がインストールされている
- GitHub CLIにログイン済み（`gh auth login`）
- Codex CLI（任意。推奨ブランチ名の生成に使用）

#### 初回のみ

Git BashまたはWSLで利用する場合は、実行権限を付与します。

```bash
chmod +x scripts/create-issue-branch.sh
```

※ PowerShellのみで利用する場合は不要です。

#### 使い方

```bash
./scripts/create-issue-branch.sh <issue-number> [branch-name]
```

#### 使用例

```bash
# Issue番号のみを指定して対話形式で選択
./scripts/create-issue-branch.sh 41

# ブランチ名を明示して非対話で実行
./scripts/create-issue-branch.sh 41 chore/41-custom-name
```

Issue番号のみを指定するとIssueタイトルを取得し、Codex CLIが利用可能な場合は英語の推奨ブランチ名を生成します。

```text
Branch name [chore/41-interactive-issue-branch]:
```

Enterを押すと表示された推奨名を採用し、別の名前を入力するとその名前を使用します。

Codex CLIが未導入、未認証、または生成に失敗した場合は、ブランチ名の手入力へ切り替わります。Codex CLIは任意の依存関係であり、ブランチ作成自体には必須ではありません。

#### 引数

| 引数 | 説明 | 例 |
|---|---|---|
| `issue-number` | GitHub Issue番号 | `41` |
| `branch-name` | 作成するブランチ名（省略時は対話入力） | `chore/41-custom-name` |

#### 実行内容

以下の処理を自動化し、安全にIssue対応ブランチを作成します。

1. 引数を検証
2. Git / GitHub CLIの存在確認
3. Gitリポジトリ内で実行されているか確認
4. 未コミット変更がないか確認
5. Issueの存在確認とタイトル取得
6. ブランチ名をAI候補または手入力から選択（省略時）
7. ブランチ名を検証
8. ローカル・リモートのブランチ重複確認
9. `dev` ブランチへ切り替え
10. `dev` を最新状態へ更新
11. Issueに紐付いたブランチを作成
12. ブランチへ切り替え
13. リモート追跡ブランチ（upstream）を設定

#### 注意事項

- 作業ツリーに未コミットの変更がある場合は実行できません。
- `dev` ブランチを最新化してから作業ブランチを作成します。
- 同名のローカル・リモートブランチが存在する場合はエラーになります。

---

### cleanup-branches.sh

マージ済みのローカルブランチを安全に削除します。

```bash
./scripts/cleanup-branches.sh
```

実行時に `git fetch --prune` でリモート追跡ブランチを更新し、現在のブランチおよび `main`、`master`、`develop`、`dev` を除外して、マージ済みのローカルブランチを `git branch -d` で削除します。

削除対象がない場合も正常終了します。

---

### finish-issue.sh

Pull Requestのマージ後に、ローカルリポジトリを `dev` ブランチの最新状態へ戻し、マージ済みのローカルブランチを整理します。

```bash
./scripts/finish-issue.sh
```

未コミットの変更がある場合は処理を中断します。

作業ツリーがクリーンな場合は `dev` へ切り替え、`git fetch --prune` と `git pull --ff-only origin dev` を実行した後、`cleanup-branches.sh` を呼び出します。

---

## 開発フロー

1. GitHub Issue
2. Approved Design
3. Implementation Prompt
4. AI Coding Agentによる実装
5. Repository Documentation Review（必要に応じて）
6. AI Context Update（必要に応じて）
7. Review
8. Commit
9. Pull Request Draft
10. Pull Request
11. Merge
12. `./scripts/finish-issue.sh`

---

## ドキュメント作成ガイドライン

- この `README.md` は日本語で記述します。
- 各文書は、主な利用者と用途に応じて「ドキュメント言語ポリシー」で定めた言語を使用します。
- Humanが主に確認・更新する文書は、原則として日本語で記述します。
- AI Coding Agentが直接参照する設計・指示・共有コンテキストは、原則として英語で記述します。
- 同一内容の日本語版と英語版を重複して管理することは、原則として避けます。
- ファイル名、ディレクトリ名、コマンド、コード、識別子、技術固有名詞は必要に応じて英語のまま維持します。
- READMEは簡潔に保ち、プロジェクトの目的と利用方法を分かりやすく記述します。
