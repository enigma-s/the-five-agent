# subagent-driven-development

## Overview
ביצוע תוכנית יישום על-ידי שיגור subagent חדש לכל task, עם ביקורת דו-שלבית (קודם spec compliance, אז code quality) אחרי כל task. הקשר נקי לכל task → איכות גבוהה ויסטרציה מהירה.

## Source path
`.claude/skills/subagent-driven-development/SKILL.md` (+ implementer-prompt.md, spec-reviewer-prompt.md, code-quality-reviewer-prompt.md)

## When to invoke
כשיש לך תוכנית יישום, ה-tasks ברובם עצמאיים, ואתה רוצה להישאר באותו סשן עם subagents (Claude Code / Codex).

## Continuous execution
"Do not pause to check in with your human partner between tasks. Execute all tasks from the plan without stopping."

## Owned/used by
- [[reuven]] — הדרך המומלצת לביצוע תוכניות גדולות

## Related
- [[writing-plans]] — מקור ה-plan שמבצעים
- [[executing-plans]] — חלופה ללא subagents
- [[requesting-code-review]] — שלב חובה אחרי כל task
- [[dispatching-parallel-agents]] — קרוב, אבל לעצמאיים-באמת ולא לתוכנית רצופה
- [[test-driven-development]] — תקף בתוך כל task
