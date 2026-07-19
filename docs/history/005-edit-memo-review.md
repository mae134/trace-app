# History

## 改善点

実装開始前のチェックリストを開発フローへ追加する。

## 理由

Issue作成後にブランチ作成を忘れるなど、開発フローの手順漏れが発生した。

実装を開始する前にチェックリストを確認することで、手順漏れを防止できる。

## 対応策

開発フローへ以下のチェックリストを追加する。

- Issue is approved
- Branch has been created
- Local branch is checked out
- Approved Design is completed

## 期待される効果

- 開発フローの手順漏れを防止できる
- HumanとChatGPTの認識を揃えやすくなる
- 安定した開発フローを維持できる

------------------------------------------------------------------------

## 改善点

GitHub Issue・Approved Design・Codex Promptの役割を明確に分離する。

## 理由

これまではIssueとPromptに設計内容が混在し、それぞれの責務が曖昧になっていた。

役割を明確に分離することで、設計レビューと実装の責務を整理できる。

## 対応策

開発フローを以下の構成とする。

```text
GitHub Issue
（What）
↓
Approved Design
（How）
↓
Codex Prompt
（Implementation Request）
↓
Codex
（Implementation）
```

- GitHub Issueは要件を管理する。
- Approved DesignはHumanとChatGPTが設計を決定する。
- Codex PromptはApproved Designを基に生成する。
- Codexは承認済み設計に従って実装する。

## 期待される効果

- 要件・設計・実装の責務を明確に分離できる
- Codexへの指示内容を統一できる
- 実装品質とレビュー効率を向上できる
- Trace Appでも同じ開発フローを適用できる

------------------------------------------------------------------------

## 改善点

Codexの最終実装レポートは日本語で出力する。

## 理由

Codexへ渡すプロンプトやApproved Designは、実装指示として明確にするため英語で記述する。

一方で、実装後の作業ログ・変更内容・検証結果はHumanがレビューするため、日本語で出力した方が確認しやすい。

## 対応策

Codex用プロンプトのAfter Implementationに以下の要件を追加する。

> Please write the final implementation report in Japanese so that the human reviewer can review it easily.

## 期待される効果

- Humanが実装内容を確認しやすくなる
- レビュー時の認知負荷を下げられる
- プロンプトは英語、レビュー報告は日本語という役割分担を明確にできる


------------------------------------------------------------------------

## 改善点

実装開始前のチェックリストに、実装プロンプトの内容を確認する項目を追加する。

## 理由

実装プロンプトにGitHub Issue本文を埋め込まずにCodexへ渡してしまい、CodexがIssueの内容を確認できない状態になった。

テンプレートのプレースホルダーが残っていても見落とす可能性があるため、実装開始前に確認する仕組みが必要である。

## 対応策

実装開始前のチェックリストへ以下の項目を追加する。

- □ GitHub Issue is embedded in the implementation prompt.

## 期待される効果

- GitHub Issueの貼り忘れを防止できる
- CodexがIssueを正しく参照できる
- 実装プロンプトの品質を安定して維持できる

------------------------------------------------------------------------

## 改善点

開発チェックリストを開発フェーズごとに分類する。

## 理由

チェックリストの項目が増えるにつれて、実行するタイミングが分かりにくくなる。

フェーズごとに整理することで、各工程で必要な確認事項を明確にできる。

## 対応策

Playbookのチェックリストを以下のようにフェーズごとへ分類する。

### Before Design

- □ Issue is approved.

### Before Implementation

- □ Branch has been created.
- □ Local branch is checked out.
- □ GitHub Issue is embedded in the implementation prompt.
- □ Approved Design is completed.

### Before Pull Request

- □ Lint passed.
- □ Build passed.
- □ Scope verified.

## 期待される効果

- 各フェーズで確認すべき項目を明確にできる
- 手順漏れを防止できる
- チェックリストの可読性を向上できる
- 開発フローを標準化できる