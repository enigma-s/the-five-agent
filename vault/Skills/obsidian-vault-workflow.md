# obsidian-vault-workflow

## Overview
ה-skill המרכזי של הפרויקט הזה. אוכף את **הפרוטוקול המחייב** של קריאה/כתיבה ל-`vault/`: בתחילת כל משימה לטעון את קובץ הנושא + Meeting Notes אחרונים, ובסוף לכתוב entry של Session Log עם wikilinks וסטטוס.

## Source path
`.claude/skills/obsidian-vault-workflow/SKILL.md`

## When to invoke
**כל משימה.** קוד, תוכן, ארכיטקטורה, UI, באגים, reviews, refactors. דילוג מותר רק בשאלות read-only שלא נוגעות בקבצים ולא מייצרות החלטות.

> בפרויקט הזה: הוראת משתמש מפורשת ב-2026-05-13 — קריאה לכל סשן ולכל פקודה. ראה [feedback memory](file://C:/Users/שושי/.claude/projects/C--Users------Desktop------the-five-agent/memory/feedback_obsidian_vault_workflow.md).

## Phase 1 (BEFORE) — Checklist
- [ ] תיקוי שם הנושא בביטוי קצר
- [ ] פתיחת `_index.md` של התיקייה הרלוונטית
- [ ] חיפוש exact filename; אם close-match — לשאול את המשתמש
- [ ] אם קובץ נושא קיים → קריאה מלאה (Overview + Open Questions + כל Session Log)
- [ ] קריאת 2–3 Meeting Notes אחרונים
- [ ] קריאת Brand Guidelines אם המשימה תוכן/UI

## Phase 2 (AFTER) — Checklist
- [ ] בחירת תיקייה
- [ ] שם קובץ `<topic>.md` (בלי תאריך)
- [ ] עדכון Overview אם scope/status השתנו
- [ ] עדכון Open Questions (להוסיף חדשים, להסיר שנפתרו)
- [ ] הוספת `### YYYY-MM-DD — <title> [status]` ב**תחתית** Session Log
- [ ] What was done / Decisions / Notes / Related (עם `[[wikilinks]]`)
- [ ] Read-back לאימות

## Status tags
`[shipped]`, `[spiked]`, `[wip]`, `[reverted]`, `[planned]`, `[debug]`

## Folders (in this vault)
- `Meeting Notes/` — קוד, ארכיטקטורה, החלטות
- `Content Briefs/` — briefs עריכתיים
- `Publishing Log/` — הרצות פרסום, post-mortems
- `Brand Guidelines/` — קול, ויזואל, טון
- (בנוסף ב-vault הזה: `Project Files/`, `Team Agents/`, `Skills/`, `Obsidian Config/`)

## Owned/used by
- [[reuven]] — חובה בכל סשן
- [[yael]], [[yuval]], [[chen]] — חובה בכל הפעלה שלהם

## Related
- [[obsidian-markdown]] — תחביר הקבצים שנכתבים
- [[obsidian-bases]] — תצוגות מעל ה-vault
- [[using-superpowers]] — ה-meta-skill לגילוי skills (זה אחד מהם)
- [[claude-md]] — איפה הצוות מוגדר; חיפוש הקשר מתחיל שם
