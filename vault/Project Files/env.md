# .env — מפתחות API פעילים

## Overview
הקובץ שמחזיק את מפתחות ה-API האמיתיים של הפרויקט. **לא נכנס ל-Git** (מוגן על-ידי [[gitignore]]). יוצרים אותו על-ידי העתקה של [[env-example]] ומילוי הערכים.

## File path
`.env`

## Belongs to
תשתית משותפת — כל הסוכנים יכולים לקרוא ממנו.

## Keys
| מפתח | בעלים | מטרה |
|---|---|---|
| `ANTHROPIC_API_KEY` | כל הצוות | קריאה ל-Claude (חובה) |
| `TAVILY_API_KEY` (אופציונלי) | [[chen]] | חיפוש מידע באינטרנט |
| `SERPER_API_KEY` (אופציונלי) | [[chen]] | חיפוש Google API חלופי |
| `OPENAI_API_KEY` (אופציונלי) | [[yuval]] | יצירת תמונות (DALL·E) |
| `STABILITY_API_KEY` (אופציונלי) | [[yuval]] | יצירת תמונות (Stable Diffusion) |

## Status
קיים בפועל בדיסק, ריק כרגע (אין מפתחות מאוכלסים).

## Related
- [[env-example]] — התבנית שממנה הקובץ הזה נוצר
- [[gitignore]] — הקובץ שמונע מ-`.env` להיכנס ל-Git
- [[chen]] — צרכן של `TAVILY_API_KEY` / `SERPER_API_KEY`
- [[yuval]] — צרכן של `OPENAI_API_KEY` / `STABILITY_API_KEY`
