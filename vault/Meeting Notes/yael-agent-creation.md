# Yael Agent Creation

## Overview
יצירת ה-sub-agent הראשון של הצוות בפועל: **יעל**, כותבת התוכן. עד הסשן הזה `.claude/agents/` היתה ריקה — יעל היתה מוגדרת רק מושגית ב-[[yael]] תחת `vault/Team Agents/`. הסשן הזה הפך אותה ל-operational: ראובן יכול לנתב אליה משימות שכתוב/עריכה. הפלט מתפצל ל-Markdown + HTML semantic מינימלי תחת `Output/`.

## Open Questions
- כאשר המשתמש יכתוב את `yael/style-guide.md`, האם להפיק דוגמת end-to-end (מאמר מקור ב-`Content/test.md` → פלט) כדי לאמת את ה-flow?
- האם נרצה sub-agent נוסף לפרסום (יעל רק כותבת, לא מפרסמת — כרגע ה-Output/ הוא הקצה)?

## Session Log

### 2026-05-13 — yael agent operational [shipped]
- **What was done:**
  - נוצר `.claude/agents/yael.md` עם YAML frontmatter (`name`, `description`, `tools: Read, Write, Edit, Glob, Grep`) ו-system prompt בעברית שמגדיר: bootstrap (קריאת `yael/style-guide.md` ו-`yael/reference/`), workflow מ-`Content/` ל-`Output/`, פורמט HTML semantic מינימלי, כללי הסרת CTAs ושימור מותגים-בנרטיב, וגבולות הסוכן.
  - נוצרו 4 תיקיות ריקות: `Content/`, `Output/`, `yael/`, `yael/reference/` (ללא קבצי placeholder — לפי החלטת המשתמש).
  - עודכן `CLAUDE.md`: בלוק יעל קיבל trigger keywords דו-לשוניים (עברית/אנגלית), נתיבי קלט/פלט, והפניה ל-`.claude/agents/yael.md`.
  - עודכן [[yael]]: Status → Operational, Defined in → קובץ הסוכן הקיים, Role הוחלף לפירוט מלא של תחום/כלים/קלט/פלט, Open Questions נוקו (הוסרה השאלה על פרסום — יעל לא מפרסמת; הוסרה ההתלייה ביצירת הסוכן עצמו).
  - עודכן [[_index|Team Agents index]]: יעל מסומנת כ-"מוגדרת ב-`.claude/agents/yael.md`".
- **Decisions:**
  - **קובץ flat ולא תיקייה** — `.claude/agents/yael.md`, לא `.claude/agents/yael/SKILL.md`. תואם את הקונבנציה של Claude Code sub-agents.
  - **HTML מינימלי** (לפי בחירת משתמש) — רק `<article>` + תגיות semantic, ללא CSS וללא styling. אם בעתיד יידרש styling, להוסיף בנפרד.
  - **ללא קבצי `.gitkeep`** (לפי בחירת משתמש) — התיקיות יקבלו tracking ב-git רק אחרי שהמשתמש יוסיף תוכן אמיתי. הסוכן מטפל גם במקרה שהתיקיות חסרות.
  - **ללא `model:` ב-frontmatter** — הסוכן יורש את המודל מההורה. משימת כתיבה לא דורשת מודל ספציפי.
  - **`yael/style-guide.md` לא נוצר כעת** — המשתמש ציין שיכתוב בנפרד. הסוכן graceful: אם אין style guide, ממשיך לפי שיקול דעת ומציין זאת בסיכום.
- **Notes / Caveats:**
  - **ה-style guide והדוגמאות ב-`yael/reference/` הם המכפיל החשוב לאיכות.** עד שלא ייכתבו, יעל תפיק פלט סביר אבל לא בסגנון הבית. זה הצעד הבא הטבעי.
  - **גבולות הסוכן הם strict:** רק `Content/`, `Output/`, `yael/`. כל בקשה לגעת במשהו אחר צריכה לחזור לראובן.
  - **תיקיות חסרות:** git לא יראה את `Content/`/`Output/`/`yael/` עד שיהיה בהן קובץ. זו החלטה מודעת — לא באג.
- **Related:** [[yael]], [[reuven]], [[claude-md]], [[_index|Team Agents index]], [[vault-initialization]], [[skill-creator-install]]
