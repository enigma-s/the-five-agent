# obsidian-bases

## Overview
יצירה ועריכה של קבצי `.base` של Obsidian — views דמויי-DB מעל הערות ה-vault. תומך ב-table, cards, list, map עם filters ו-formulas.

## Source path
`.claude/skills/obsidian-bases/SKILL.md`

## When to invoke
- עבודה על קבצי `.base`
- יצירת תצוגות database-like של הערות
- המשתמש מזכיר Bases, table views, card views, filters, formulas ב-Obsidian

## Workflow
1. יצירת קובץ `.base` עם YAML תקין
2. הגדרת `filters` (לפי tag, folder, property, date)
3. הוספת `formulas` (אופציונלי) — תכונות מחושבות
4. הגדרת views (`table` / `cards` / `list` / `map`) עם `order` של properties להציג
5. אימות YAML תקין
6. בדיקה ב-Obsidian

## Owned/used by
- [[reuven]] — אם נחליט להוסיף תצוגות database-like ל-vault הזה

## Related
- [[obsidian-markdown]] — שפת ההערות שמופיעות ב-views
- [[obsidian-vault-workflow]] — פרוטוקול ה-vault הכללי
- [[Obsidian Config/_index|Obsidian Config]] — תצורת האפליקציה (`core-plugins-json` מאפשרת `bases: true`)
