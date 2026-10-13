---
name: leantoken
description: Use LeanToken for token-bounded repository exploration, audits, codebase investigations, architecture reviews, source archaeology, code search, symbol outlines, exact source reads, symbol history, and structural JSON queries.
---

<!-- managed by leantoken setup -->

Before retrieving repository source, including for audits and code archaeology, discover the deferred `leantoken` MCP server and choose the narrowest applicable lane:

1. For autonomous broad triage, call `leantoken.context` once with `plan_only=false` and use the materialized evidence directly. Make at most one focused follow-up only when coverage identifies a concrete gap.
2. For known scope, `leantoken.files` finds paths, `leantoken.outline` maps definitions and imports, and `leantoken.search` locates symbols, references, identifiers, text, or regex matches. `leantoken.read` returns the exact current symbol or narrow line range; `leantoken.history` reads, diffs, or traces symbols across immutable Git revisions; `leantoken.json` queries, summarizes, or compares exact JSON artifacts without whole-file output.
3. For human review or control-plane inspection before expensive or high-risk materialization, call `leantoken.context` with `plan_only=true`, inspect the bounded metadata and coverage, then materialize after approval.

Pass `BASE..HEAD` as `base_revision` with `strict_changed_paths` for immutable range context. Use `leantoken.savings` for repository-local savings. Use native workspace tools for edits, commands, tests, runtime probes, unsupported files, or evidence that is not source retrieval. If the server or tools cannot be discovered, run `npm exec --yes --package=leantoken@0.1.28 -- leantoken doctor --json` and report its structured registration, launch, handshake, and catalog status instead of silently claiming LeanToken was used.
