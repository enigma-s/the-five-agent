# כתבה: התפתחות חברות האוטומציה ו-CRM ב-no-code בישראל

## Overview

כתבה מגזינית בעברית (~900 מילים) שהופקה במסגרת תהליך B+C המלא של הצוות: חן ביצעה מחקר רשת ושמרה 4 מקורות ב-`Content/`, יעל כתבה את הכתבה עם 3 placeholders ב-`Output/`, יובל הפיק 3 תמונות ב-`yuval/outputs/`, ואני (ראובן) מיזגתי הכל ל-MD ול-HTML עם `<figure>` + caption. הזווית הסיפורית: המתח בין הבוננזה של עשור ה-no-code הישראלי (monday.com כעוגן) לבין הגל הבא של agentic automation (Claude Code, נפילת monday ב-21% בפברואר 2026). הסטטוס: shipped, מוכן להצגה ב-preview.

## Open Questions

- האם נדרשת גרסה מקוצרת לסושיאל (LinkedIn / Twitter thread) מהכתבה הזו?
- כדאי לעדכן את `gpt-image-gen` skill עם PowerShell fallback — יובל נאלץ לעקוף את הסקיל כי `python`/`jq` לא זמינים בסביבת Windows (הוא דיווח על זה).
- `yael/style-guide.md` ו-`yael/reference/` לא קיימים — יעל ציינה את זה. אם יוצאים לעוד כתבות, כדאי לבסס style guide.

## Session Log

### 2026-05-13 — הפקת הכתבה הראשונה תהליך B+C [shipped]
- **What was done:** חן ביצעה WebSearch+WebFetch על monday.com, AI upheaval, CRM ישראלי, אוטומציה — 4 מקורות ב-`Content/2026-05-13-*.md`. יעל כתבה ~900 מילים ב-5 סקציות עם 3 placeholders. יובל הפיק 3 תמונות 1536×1024 ב-`yuval/outputs/`. מיזגתי את כל ה-placeholders ל-`<figure>` עם caption ב-HTML ול-`![]()` ב-MD.
- **Decisions:** (1) שילבתי תהליך B+C במהלך אחד במקום להפריד — חיסך turn-trip ליעל. (2) שלוש תמונות עם סגנונות שונים (editorial photo + flat illustration + abstract concept) במקום סגנון אחיד — תואם את שלוש הסקציות הסיפוריות. (3) ב-HTML החלפתי את ה-`.placeholder` styles ב-`figure` styles עם box-shadow ו-caption — נראה כמו מגזין דיגיטלי. (4) השארתי את caption בעברית גם כש-alt באנגלית לא — RTL flow.
- **Notes / Caveats:** יובל נאלץ לעקוף את `gpt-image-gen` skill (אין python/jq בסביבה הזו, הוא השתמש ב-PowerShell `Invoke-RestMethod`). מודל `gpt-image-2` נשמר. מקור Webmagazine היה חלש (שימש רק לרקע). מקור CTech מנובמבר 2024 — קצת ישן אבל baseline הכרחי. מקור Bar-Ilan ניסיון WebFetch נכשל.
- **Related:** [[chen]], [[yael]], [[yuval]], [[reuven]], [[claude-md]], [[chen-agent-creation]], [[yael-agent-creation]], [[yuval-agent-creation]]
