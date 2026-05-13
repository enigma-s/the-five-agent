# Yuval Agent Creation

## Overview
יצירת ה-sub-agent השני של הצוות בפועל: **יובל**, מעצב התמונות. עד הסשן הזה `.claude/agents/yuval.md` לא היה קיים — יובל היה מוגדר רק מושגית ב-[[yuval]] תחת `vault/Team Agents/`. הסשן הזה הפך אותו ל-operational: ראובן יכול לנתב אליו משימות תמונה. בנוסף, נוצר סקיל `gpt-image-gen` שעוטף את OpenAI Images API (model `gpt-image-2`), ונבנה protocol מלא לחיבור יעל→יובל דרך `{{IMAGE_NEEDED: "..."}}` placeholders.

## Open Questions
- האם יש Brand Guidelines ויזואליים שצריך לתעד תחת `vault/Brand Guidelines/` (פלטה, סגנון, פונטים) או שה-`yuval/reference/` מספיק כ-source of truth?
- האם לעתיד נרצה להעתיק תמונות ל-`Output/` כדי שהמאמרים יהיו self-contained (היום: relative path ל-`yuval/outputs/`)?
- ספק חלופי (Stability AI) — האם להוסיף סקיל מקביל, או להישאר עם OpenAI בלבד?

## Session Log

### 2026-05-13 — yuval agent operational + gpt-image-gen skill [shipped]
- **What was done:**
  - נוצר `.claude/skills/gpt-image-gen/SKILL.md` — מעטפת לקריאת OpenAI Images API במודל `gpt-image-2`. כוללת מסלול ראשי (curl + jq) ו-Python fallback (כי jq חסר ב-Git Bash על Windows). תיעוד מפורש שאסור לשנות את שם המודל גם אם הידע הפנימי לא מזהה אותו (המודל יצא ב-2026-04-21).
  - נוצר `.claude/agents/yuval.md` עם YAML frontmatter (`name`, `description`, `tools: Read, Write, Bash, Glob`) ו-system prompt בעברית: bootstrap (סריקת `yuval/reference/` וחילוץ סגנון), workflow מקבלת brief עד שמירת PNG + sibling `.txt`, כללי "אל תשנה את שם המודל" ו-"אל תעקוף את הסקיל".
  - עודכן `CLAUDE.md`: בלוק יובל קיבל trigger keywords דו-לשוניים, נתיב reference/output, וקישור לסקיל; נוספה סקציה חדשה "תהליך משולב: מאמר עם תמונות" שמתארת את ה-handshake יעל→ראובן→יובל→ראובן; מבנה הפרויקט עודכן לכלול `yuval/`.
  - עודכן `.claude/agents/yael.md`: צעד 3 (שכתוב) קיבל הוראה להכניס `{{IMAGE_NEEDED: "..."}}` placeholders באנגלית כשמזהה נקודה טבעית לתמונה; צעד 5 (סיכום) קיבל פורמט רשימה ממוספרת של כל ה-placeholders שהשאירה, כדי שראובן ינתב ליובל.
  - עודכנו `.env` ו-`.env.example`: הוסר ה-`#` מ-`OPENAI_API_KEY=` (המפתחות עוברים מ-optional ל-active עבור יובל).
  - תיקיות `yuval/reference/` ו-`yuval/outputs/` לא נוצרות עכשיו — ייווצרו אוטומטית כשיובל יכתוב את התמונה הראשונה (תואם לתקדים יעל, ללא `.gitkeep`).
- **Decisions:**
  - **קובץ flat לסוכן** — `.claude/agents/yuval.md`, לא תיקייה. תואם את הקונבנציה של Claude Code sub-agents ואת התקדים של יעל.
  - **שם המודל `gpt-image-2` מקובע** — המשתמש סיפק את שם המודל עם אזהרה מפורשת שהוא אמיתי אך עשוי לא להופיע בידע הפנימי. הוטמע גם בסקיל, גם בסוכן, וגם ב-CLAUDE.md ככלל מחייב. שגיאת API → לאבחן key/params, לא לשנות שם.
  - **Python fallback בסקיל** — לא רק jq, כי הסביבה העיקרית של הפרויקט היא Git Bash על Windows שבו jq בד"כ חסר. הסקיל מנסה jq, ונופל ל-python במקרה הצורך.
  - **`{{IMAGE_NEEDED: "..."}}` באנגלית** — image models עובדים טוב יותר באנגלית. יעל מתרגמת תוך כדי כתיבת ה-placeholder; יובל מעדיף לקבל brief מוכן באנגלית.
  - **ראובן מחליף את ה-placeholders, לא יעל ולא יובל** — גבולות הסוכנים נשמרים: יעל לא נוגעת ב-`yuval/`, יובל לא נוגע ב-`Output/`. ראובן הוא היחיד שעורך את הקובץ הסופי של יעל אחרי שיובל סיים.
  - **תמונות נשארות ב-`yuval/outputs/`** — לא מועתקות ל-`Output/`. ה-MD/HTML מצביעים ב-relative path. החלטה למען פשטות; אפשר לשנות אם פרסום עתידי ידרוש assets co-located.
  - **`OPENAI_API_KEY` נכנס ל-`.env` באמת** — המשתמש מילא ערך אמיתי בזמן הסשן. הקובץ ב-`.gitignore` (מאומת ב-`1c05627`), כך שהמפתח לא דולף ל-git.
- **Notes / Caveats:**
  - **תיקיות חסרות:** `yuval/reference/` ו-`yuval/outputs/` לא יראו ב-git עד שיהיה בהן קובץ. זו החלטה מודעת, תואמת לתקדים יעל.
  - **`yuval/reference/` ריק כרגע** — עד שהמשתמש יוסיף תמונות השראה, יובל ייצור תמונות לפי ה-brief בלבד ויציין בדיווח שאין reference. **זה המכפיל הוויזואלי החשוב** — בלעדיו אין עקביות בין תמונות.
  - **לא הורצה בדיקת end-to-end** של ה-API — חיוב כרטיס וקריאה אמיתית למודל לא בוצעו בסשן הזה. הסמוק-טסט מהסקיל מתועד כצעד הבא של המשתמש.
  - **המודל `gpt-image-2` עלול לא להיות מוכר לסוכנים** — חוזרים על האזהרה: לא לשנות. אם שגיאה — key/params.
- **Related:** [[yuval]], [[yael]], [[reuven]], [[claude-md]], [[yael-agent-creation]], [[skill-creator-install]], [[vault-initialization]]
