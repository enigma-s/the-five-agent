# writing-plans

## Overview
כתיבת תוכניות יישום מקיפות, בהנחה שהמהנדס לא יודע כלום על ה-codebase ושטעם הוא בעייתי. מתעד הכול: אילו קבצים לגעת לכל task, קוד, בדיקות, docs לבדוק, איך לבדוק. שובר ל-tasks קטנים.

## Source path
`.claude/skills/writing-plans/SKILL.md` (+ plan-document-reviewer-prompt.md)

## Output path
`docs/superpowers/plans/YYYY-MM-DD-<feature-name>.md`

## When to invoke
כשיש spec או דרישות למשימה רב-שלבית — **לפני** שנוגעים בקוד.

## Core principles
DRY. YAGNI. TDD. Frequent commits.

## Owned/used by
- [[reuven]] — אחרי שה-spec מ-[[brainstorming]] מאושר

## Related
- [[brainstorming]] — מה שקודם (spec → plan)
- [[executing-plans]] — מה שבא אחרי (plan → execution)
- [[subagent-driven-development]] — דרך מומלצת לבצע
- [[using-git-worktrees]] — מתי לבודד לפני execution
- [[test-driven-development]] — חלק מליבת התוכנית
