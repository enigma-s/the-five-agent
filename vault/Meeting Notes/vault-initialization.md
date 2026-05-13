# Vault Initialization

## Overview
אתחול ה-vault של פרויקט The Five Agent. המטרה: לתעד בקובץ MD נפרד כל אחד מקבצי הפרויקט הקיימים, עם הסבר על תפקידו, השיוך שלו לסוכן צוות, ו-wikilinks לכל הקבצים הקשורים. המבנה מארגן את ה-vault ב-4 תיקיות תוכן ראשיות (`Project Files`, `Team Agents`, `Skills`, `Obsidian Config`) + `Meeting Notes` ליומני עבודה.

## Open Questions
- האם השם "The Five Agent" מרמז על חבר צוות חמישי שעוד לא קיים? נכון לעכשיו מתועדים 4 (ראובן + יעל + יובל + חן).
- האם להוסיף `.obsidian/workspace.json` ל-`.gitignore` כדי להפחית רעש ב-diff? (ראה [[workspace-json]])
- שלושת קובצי הסוכן ([[yael]], [[yuval]], [[chen]]) טרם נוצרו כקבצי agent ב-`.claude/agents/` — עדיין מוזכרים רק ב-[[claude-md]].
- כללי הניתוב המדויקים של [[reuven]] לכל סוג בקשה — חסרים ב-[[claude-md]].

## Session Log

### 2026-05-13 — Vault scaffold + per-file documentation [shipped]
- **What was done:**
  - שינוי שם תיקייה: `wault/` → `vault/` (לעמוד בציפיית ה-skill).
  - יצירת מבנה: `Project Files/`, `Team Agents/`, `Skills/`, `Obsidian Config/`, `Meeting Notes/`.
  - כתיבת מסמכי MD לכל קובץ קיים בפרויקט: 4 ב-Project Files, 4 ב-Team Agents, 17 ב-Skills, 4 ב-Obsidian Config.
  - `_index.md` לכל תיקייה + master `vault/_index.md`.
  - feedback memory ב-`~/.claude/projects/.../memory/feedback_obsidian_vault_workflow.md` כך שה-skill `obsidian-vault-workflow` יופעל אוטומטית בכל סשן עתידי.
- **Decisions:**
  - **vault במקום wault** — תוקן לפי בקשת המשתמש, כך שה-skill עובד "out of the box".
  - **ארגון לפי סוג קובץ בפרויקט** ולא לפי הסכמה הסטנדרטית של ה-skill (Meeting Notes / Content Briefs / Publishing Log / Brand Guidelines) — המשימה היא תיעוד מסמכים, לא session logging טהור. הסכמה הסטנדרטית נשמרה כתיקייה אחת (`Meeting Notes/`) ל-session logs.
  - **wikilinks בעברית/אנגלית מעורבים** — שמות קבצים lowercase-hyphenated באנגלית; טקסטים ב-MD בעברית. תואם להעדפת המשתמש בפרויקט.
  - **memory persistence** — נשמר ב-feedback memory ולא רק ב-CLAUDE.md, כך שהוא חי גם בלי המסמך הזה.
- **Notes / Caveats:**
  - תיקיות `.claude/agents/` ו-`.claude/commands/` ריקות — תיעוד הסוכנים הקיים מבוסס על [[claude-md]] בלבד.
  - `Content Briefs/`, `Publishing Log/`, `Brand Guidelines/` (שמופיעות בסכמת ה-skill) לא נוצרו עדיין — ייווצרו לפי הצורך.
  - אם הקבצים יורחבו בעתיד, יש לעדכן את ה-`_index.md` המתאים ולתעד session entry חדש כאן או בקובץ נושא תואם.
- **Related:** [[claude-md]], [[reuven]], [[yael]], [[yuval]], [[chen]], [[obsidian-vault-workflow]], [[Skills/_index|Skills index]], [[Project Files/_index|Project Files index]]
