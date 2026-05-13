# Skills — Index

כל ה-skills הזמינים בפרויקט, מותקנים תחת `.claude/skills/`. כל skill הוא חבילת `SKILL.md` (לפעמים עם קבצי עזר) שמלמדת את Claude טכניקה או פרוטוקול.

המקור: רוב ה-skills הותקנו מ-Superpowers (commit `d057c4e`). שלושת ה-Obsidian נוספו מאוחר יותר.

## Topics — Superpowers (תהליכי פיתוח)

- [[brainstorming]] — חובה לפני כל עבודה יצירתית; ממיר רעיון לעיצוב מאושר
- [[writing-plans]] — כתיבת תוכניות יישום מפורטות מתוך ספק
- [[executing-plans]] — ביצוע תוכנית כתובה בסשן נפרד
- [[subagent-driven-development]] — ביצוע תוכנית על-ידי subagent למשימה (עם ביקורת דו-שלבית)
- [[dispatching-parallel-agents]] — הרצת agents במקביל למשימות עצמאיות
- [[using-git-worktrees]] — בידוד עבודה ב-worktree
- [[finishing-a-development-branch]] — סגירת ענף פיתוח (merge / PR / cleanup)

## Topics — Quality & Verification

- [[test-driven-development]] — TDD: כותבים בדיקה לפני קוד
- [[systematic-debugging]] — root cause לפני תיקון
- [[verification-before-completion]] — לא טוענים "הסתיים" בלי הוכחה
- [[requesting-code-review]] — שיגור reviewer subagent
- [[receiving-code-review]] — קבלת פידבק בלי הסכמה מבוייסת
- [[writing-skills]] — יצירת skill חדש בגישת TDD

## Topics — Infrastructure

- [[using-superpowers]] — איך מוצאים ומפעילים skills
- [[obsidian-vault-workflow]] — הפרוטוקול המחייב של ה-vault הזה
- [[obsidian-markdown]] — Obsidian Flavored Markdown (wikilinks, callouts, properties)
- [[obsidian-bases]] — קבצי `.base` ל-views של נתונים ב-Obsidian

## Topics — Skill Authoring (Anthropic Official)

- [[skill-creator]] — יצירה / עריכה / evals של skills; חופף ל-[[writing-skills]] אבל עם כלים מובנים. **Project scope** (commit `4e9d768`)
