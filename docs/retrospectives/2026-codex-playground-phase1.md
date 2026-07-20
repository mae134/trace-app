# Project Retrospective

## Project Overview

本プロジェクトでは、Codex・ChatGPT・GitHubを活用した実践的なAI開発フローを構築・検証することを目的とした。

単にメモアプリを開発するだけではなく、GitHub Issueを中心とした運用、Approved Designによる設計レビュー、AIとの役割分担、Pull Request運用、ドキュメント管理など、一連の開発プロセスを実際に運用しながら改善を行った。

本プロジェクトで確立した開発フローは、今後開発するTrace Appへ適用することを目標としている。

---

## What Went Well

- GitHub Issueを中心とした開発フローを確立できた。
- Human・ChatGPT・Codexそれぞれの役割と責務を明確に整理できた。
- GitHub Issue（What）とApproved Design（How）の責務を分離できた。
- 開発で利用するプロンプトテンプレートを整備し、再利用可能な形にできた。
- Playbook・Prompt・Checklist・History・ADR・Designなど、ドキュメント構成を整理できた。
- 実際のGitHub Issueを通して運用を検証し、机上では分からない改善点を確認できた。
- メモアプリを完成させ、UI改善も既存機能を維持したまま実施できた。

---

## Challenges

- プロンプトテンプレートが増え、一覧との同期漏れが発生しやすくなった。
- Repository Documentationの更新対象を判断するために、リポジトリ全体を確認する必要があった。
- AI ContextやRepository Documentationを更新する適切なタイミングは、実際に運用して初めて見えてきた。
- 運用ルールの多くは、実際にIssueを進めながら改善していく必要があった。
- ドキュメント量が増えたことで、保守性とのバランスを継続的に考える必要がある。

---

## Improvement Actions

- 実際のGitHub Issueを通して開発フローを継続的に検証する。
- 大きな実装後はRepository Documentation Reviewを実施する。
- プロンプト一覧と実際のファイル構成の整合性を定期的に確認する。
- AI Contextを定期的に更新し、リポジトリの状態と一致させる。
- 大きな変更ではなく、小さな改善を積み重ねながら運用を成熟させる。

---

## Ongoing Items

- Playgroundで開発フローの改善を継続して検証する。
- Playgroundで確立した運用をTrace Appへ適用する。
- 改善案はまずHistoryへ記録し、十分に検証した後でPlaybook・Prompt・Checklistへ反映する。
- AIを活用した開発手法を継続的に検証・改善する。

---

## Conclusion

本プロジェクトでは、単にメモアプリを完成させるだけでなく、Human・ChatGPT・Codexが協調して開発を進めるための実践的なAI開発フローを構築・検証することができた。

今後は、このPlaygroundで得られた知見を活かし、より実践的なアプリケーションであるTrace Appへ展開していく。
