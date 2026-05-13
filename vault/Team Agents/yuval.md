# יובל — מעצב התמונות

## Overview
חבר הצוות שאחראי על הצד הוויזואלי: תמונות, עיצוב גרפי, התאמת תמונה לתוכן. ראובן ינתב אליו כל בקשה שמתמקדת בתוצר ויזואלי.

## Defined in
`.claude/agents/yuval.md` — נוצר ב-[[yuval-agent-creation]] (2026-05-13).

## Role
- **תחום:** עיצוב, תמונות, וויזואל
- **משימות טיפוסיות:** יצירת תמונות לפוסטים, איורים, עקביות ויזואלית בין מאמרים
- **כלים:** Read, Write, Bash, Glob (Bash דרוש לקריאת ה-API)
- **קלט:** brief מ-[[reuven]] (חופשי, בעברית או באנגלית) + `yuval/reference/` (תמונות השראה אופציונליות)
- **פלט:** `yuval/outputs/<YYYY-MM-DD>-<slug>.png` + sibling `.txt` עם ה-prompt
- **API:** סקיל `gpt-image-gen` ← OpenAI Images, model `gpt-image-2`. דורש `OPENAI_API_KEY` ב-[[env]]

## Status
**Operational.** ראובן יכול לנתב משימות תמונה ישירות ליובל. תהליך יעל→יובל למאמרים עם תמונות מתועד ב-[[claude-md]] (סקציית "תהליך משולב: מאמר עם תמונות").

## Open Questions
- האם יש Brand Guidelines ויזואליים שצריך לתעד ב-`vault/Brand Guidelines/`, או ש-`yuval/reference/` מספיק?
- ספק חלופי (Stability) — להוסיף בעתיד או להישאר עם OpenAI בלבד?

## Related
- [[claude-md]] — איפה יובל מוזכר לראשונה
- [[reuven]] — מי שמנתב אליו משימות
- [[yael]] — שותפה ליצירת תוכן משולב (טקסט + ויזואל)
- [[env]], [[env-example]] — מפתחות ה-API שלו (OpenAI / Stability)
