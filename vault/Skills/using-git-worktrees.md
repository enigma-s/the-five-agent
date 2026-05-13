# using-git-worktrees

## Overview
מבטיח שעבודה מתבצעת ב-workspace מבודד. תחילה מזהה אם כבר במקום מבודד, אז מנסה כלים native של הפלטפורמה (כמו EnterWorktree), ורק אז fallback ל-`git worktree` ידני.

## Source path
`.claude/skills/using-git-worktrees/SKILL.md`

## When to invoke
- לפני התחלת עבודה על פיצ'ר שדורש בידוד
- לפני ביצוע תוכנית יישום ([[executing-plans]] / [[subagent-driven-development]])

## Core principle
"Detect existing isolation first. Then use native tools. Then fall back to git. Never fight the harness."

## Owned/used by
- [[reuven]] — בתחילת עבודת פיתוח גדולה

## Related
- [[executing-plans]] — שני שלבים שעובדים יחד
- [[subagent-driven-development]] — מומלץ לרוץ ב-worktree
- [[finishing-a-development-branch]] — סוגר את ה-worktree
