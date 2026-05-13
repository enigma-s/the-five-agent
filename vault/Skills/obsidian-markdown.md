# obsidian-markdown

## Overview
יצירה ועריכה של Obsidian Flavored Markdown — הרחבות של CommonMark/GFM: wikilinks, embeds, callouts, properties (frontmatter), comments. מתועד בעיקר wikilink-ים `[[Note]]` ו-embed-ים `![[Note]]`.

## Source path
`.claude/skills/obsidian-markdown/SKILL.md`

## When to invoke
- עבודה על קבצי `.md` בתוך vault של Obsidian
- המשתמש מזכיר wikilinks, callouts, frontmatter, tags, embeds, או הערות Obsidian

## Workflow
1. **frontmatter:** properties (title, tags, aliases) בראש הקובץ
2. **תוכן:** Markdown סטנדרטי + תחביר Obsidian
3. **קישורים פנימיים:** `[[Note]]` (Obsidian עוקב אחרי שינויי שם אוטומטית)
4. **embeds:** `![[embed]]`
5. **callouts:** `> [!type]`
6. **אימות:** בדיקה ב-reading view

## Convention chosen for this vault
- כל קישור פנימי = `[[wikilink]]` (לא markdown link)
- שמות קבצים lowercase-hyphenated, בלי תאריך

## Owned/used by
- [[reuven]] — כל פעם שכותב ל-vault הזה
- כל ה-skill files שכותבים ל-vault — חייבים את ה-skill הזה

## Related
- [[obsidian-vault-workflow]] — הפרוטוקול הגדול שמשתמש בתחביר הזה
- [[obsidian-bases]] — קבצי `.base` שתופסים את ה-md-ים האלו ב-view
