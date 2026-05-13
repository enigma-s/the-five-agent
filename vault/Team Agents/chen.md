# חן — חוקרת הרשת

## Overview
חברת הצוות שאחראית על מציאת מקורות ומידע **עדכני** באינטרנט. ראובן ינתב אליה כל בקשה שדורשת מאמר/מקור/עובדה מהרשת לפני יצירת התוכן בפועל. חן משתמשת ב-`WebSearch` + `WebFetch` native של Claude Code (ללא Tavily/Serper), שומרת מקור raw ב-`Content/<YYYY-MM-DD>-<slug>.md` כקלט ליעל, ומתעדת כל חיפוש ב-`chen/Memory/searches.md` כדי למנוע חיפושים כפולים.

## Defined in
מוגדרת ב-`.claude/agents/chen.md` (flat). מוזכרת ב-[[claude-md]] (תהליכים A/B/C).

## Role
- **תחום:** מחקר רשת בלייב — מאמרים, פוסטים, release notes, מקורות ראשוניים.
- **כלים:** `WebSearch`, `WebFetch`, `Read`, `Write`, `Edit`, `Glob`, `Grep`. **אין** Bash ו**אין** API חיצוני.
- **קלט:** בקשה מראובן עם נושא / מילות מפתח / סוג מאמר רצוי.
- **פלט:** קובץ `Content/<YYYY-MM-DD>-<slug>.md` עם frontmatter (source_url, source_title, fetched_at, ...) ותוכן raw מהמקור. בנוסף — entry ב-`chen/Memory/searches.md`.
- **תלויות סביבה:** אין. לא דורשת מפתחות API.
- **גבולות:** לא משכתבת (יעל), לא מייצרת תמונות (יובל), לא מפרסמת, לא קוראת לסוכנים אחרים.

## Memory mechanism
לפני כל חיפוש חן מריצה `Grep` על `chen/Memory/searches.md` עם מילות המפתח מהבקשה. אם יש match ב-30 הימים האחרונים — היא **עוצרת** ומחזירה לראובן הודעת re-use. ראובן מחליט אם לעבוד על הקיים או לחפש מחדש. נושאים דינמיים (חדשות/מחירים/סטטיסטיקות) — חן ממליצה לחפש מחדש גם אם יש זיכרון.

## Status
**Operational** — `.claude/agents/chen.md` נוצר; `chen/Memory/searches.md` מאותחל; ראובן יודע לנתב אליה דרך תהליכים A/B/C ב-[[claude-md]].

## Open Questions
- האם להוסיף בעתיד היוריסטיקה אוטומטית לזיהוי "נושא דינמי" (כדי שחן תחליט בעצמה לעקוף re-use), במקום להישען על ניסוח הבקשה?
- האם דרושים בעתיד source whitelist/blacklist קונפיגורבילים (קובץ בנפרד), או שהקריטריונים בתוך ה-system prompt מספיקים?

## Related
- [[claude-md]] — שם מוגדרים תהליכים A (מחקר בלבד), B (מחקר→שכתוב), C (תמונות)
- [[reuven]] — מי שמנתב אליה משימות; הוא היחיד שקורא לה ולא היא לאף סוכן אחר
- [[yael]] — הצרכנית של הקבצים שחן מניחה ב-`Content/`
- [[chen-agent-creation]] — סשן ההפעלה (Meeting Notes)
- [[_index|Team Agents index]]
