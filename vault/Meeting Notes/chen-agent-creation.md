# Chen Agent Creation

## Overview
יצירת ה-sub-agent השלישי של הצוות בפועל: **חן**, חוקרת הרשת. עד הסשן הזה חן היתה מוגדרת רק מושגית ב-[[chen]] תחת `vault/Team Agents/` (עם תכנון ישן להישען על Tavily/Serper). הסשן הזה הפך אותה ל-operational בגישה אחרת: `WebSearch` + `WebFetch` native של Claude Code, ללא תלות ב-API חיצוני. בנוסף נוסף מנגנון זיכרון (`chen/Memory/searches.md`) שמונע חיפושים כפולים ב-30 ימים, ו-CLAUDE.md הורחב לשלושה תהליכים מפורשים (A: מחקר בלבד, B: מחקר→שכתוב, C: שכתוב עם תמונות).

## Open Questions
- האם להוסיף בעתיד היוריסטיקה אוטומטית לזיהוי "נושא דינמי" שיגרום לחן לעקוף re-use גם כשמילות המפתח מתאימות?
- האם דרושים בעתיד source whitelist/blacklist בקובץ נפרד, או שהקריטריונים בתוך ה-system prompt מספיקים?
- האם להוסיף end-to-end test ידני (בקשה אמיתית לחן → קובץ ב-`Content/` → memory entry) ברגע ש-style guide של יעל מוכן?

## Session Log

### 2026-05-13 — chen agent operational [shipped]
- **What was done:**
  - נוצר `.claude/agents/chen.md` עם YAML frontmatter (`name: chen`, `description` דו-לשונית עם triggers, `tools: WebSearch, WebFetch, Read, Write, Edit, Glob, Grep`) ו-system prompt בעברית שמגדיר: סקציית "ההבדל מ-LLM רגיל" (טעם הסוכן), Bootstrap (קריאת memory לפני כל חיפוש, פילטר 30 ימים, חריג לנושאים דינמיים), workflow מפורט (WebSearch → סינון → WebFetch → בחירה → שמירה ב-`Content/<YYYY-MM-DD>-<slug>.md` עם frontmatter `source_url`/`source_title`/`fetched_at`/etc.), פורמט memory entry מחייב, קריטריוני איכות (✅ ראשוניים/פרסומים מובילים/עברית כשרלוונטי; ❌ אגרגטורים/clickbait/AI-generated), וגבולות strict.
  - נוצר `chen/Memory/searches.md` — קובץ אתחול עם header, הסבר פורמט, והנחיה להוסיף entries בתחתית.
  - עודכן `CLAUDE.md`:
    - בלוק חן עבר מ-line stub אחד ("**חן** - החוקרת. אחראית על איסוף מידע...") לבלוק מלא עם trigger keywords דו-לשוניים, נתיבי memory/output, וציון שאין צורך ב-API חיצוני.
    - הסקציה "תהליך משולב: מאמר עם תמונות" הוחלפה ב-"תהליכים משולבים" עם שלושה תהליכים: A (מחקר בלבד — חן שומרת ב-`Content/` ועוצר), B (מחקר→שכתוב — חן→יעל→אופציונלית יובל), C (שכתוב עם תמונות — יעל→יובל, הסקציה הקיימת מועברת בשלמותה).
    - מבנה התיקיות עודכן: `Content/` תואר מחדש כיעד של חן + מקור של יעל; `chen/` נוסף כאזור עבודה חדש.
    - נוספה הערה ארכיטקטונית מודגשת: חן ויעל **לא** קוראות זו לזו ישירות — ראובן מתזמן.
  - עודכן [[chen]]: Status → Operational; Defined in → `.claude/agents/chen.md` (לא עוד "טרם נוצר"); Role עודכן לתיאור מלא של WebSearch+WebFetch (במקום ההפניה הישנה ל-Tavily/Serper); נוספה סקציה "Memory mechanism"; Open Questions נוקו והוחלפו בשתיים חדשות רלוונטיות לסטטוס הנוכחי.
  - עודכן [[_index|Team Agents index]]: השורה של חן עברה מ-"טרם מוגדרת" ל-"מוגדרת ב-`.claude/agents/chen.md`"; ה-overview של ה-index התעדכן ל-"שלושת האחרים operational".
- **Decisions:**
  - **WebSearch+WebFetch native, לא Tavily/Serper** — שינוי תכנון ביחס ל-[[chen]] המקורי. הסיבה: Claude Code מספק את הכלים האלה ללא תלות בקונפיג חיצוני, מפתחות API, או חשבונות שירותי צד שלישי. פשוט יותר ופחות נקודות כשל. ה-`.env.example` נשאר עם השורות המעורבות של `TAVILY_API_KEY` / `SERPER_API_KEY` (אופציונליות, מוערות) — לא הוסר כי הוא לא חיוני לתפעול עכשיו, אבל גם לא נחוץ.
  - **קובץ flat ולא תיקייה** — `.claude/agents/chen.md`, תואם את הקונבנציה של yael/yuval ושל Claude Code sub-agents בכלל.
  - **חן raw, יעל היא המשכתבת** — חן שומרת את תוכן המקור כפי שהוא (עם attribution ב-frontmatter), בלי לערוך/לתרגם/לסכם. ההפרדה הזו שומרת את חן ממוקדת ומאפשרת ליעל לקבל קלט עקבי.
  - **memory format מובנה ומחייב** — heading `## YYYY-MM-DD HH:MM | נושא`, מילות מפתח, שאילתות, מקורות עם דירוג ⭐, מקור נבחר וסיבה, שם קובץ ב-Content. הפורמט מאפשר Grep מהיר ויעיל ב-Bootstrap.
  - **30 ימים = חלון re-use** — תקופה ארוכה מספיק כדי לתפוס חזרות, קצרה מספיק כדי לא להחזיר תוכן מיושן בנושאים שלא דינמיים. ראובן מקבל את ההחלטה הסופית (חן רק מציעה).
  - **תהליך A עוצר ולא ממשיך אוטומטית** — אם המשתמש ביקש רק "מצא לי", ראובן מחזיר את הקובץ ולא קורא ליעל מיוזמתו. שכתוב הוא בקשה נפרדת.
  - **ללא `model:` ב-frontmatter** — הסוכן יורש את המודל מההורה (כמו yael/yuval). מחקר רשת לא דורש מודל ספציפי.
- **Notes / Caveats:**
  - **`Content/` כבר לא ריקה** — יש בה את `מאמר CRM.txt` ידני. חן תכתוב לידו עם שמות בפורמט `<YYYY-MM-DD>-<slug>.md`, אז לא צפויים קונפליקטים. יעל קוראת מ-`Content/` בלי להבחין מאיפה הקובץ הגיע.
  - **`chen/Memory/searches.md` ריק כרגע** — ה-Bootstrap של חן graceful, `Grep` ללא matches → ממשיכה לחיפוש רגיל. הפעלה ראשונה אמיתית תיצור את ה-entry הראשון.
  - **גבולות הסוכן strict** — חן לא נוגעת ב-`Output/`, `yael/`, `yuval/`, `.claude/`, `vault/`. רק `chen/` ו-`Content/` (כתיבה).
  - **קוונטיזציה של memory entries** — בעוד חודשים-שנים הקובץ יכול לגדול. אם זה יהפוך לבעיה, אפשר לפצל לפי שנה/רבעון. לא דחוף.
- **Related:** [[chen]], [[yael]], [[yuval]], [[reuven]], [[claude-md]], [[_index|Team Agents index]], [[yael-agent-creation]], [[yuval-agent-creation]], [[vault-initialization]]
