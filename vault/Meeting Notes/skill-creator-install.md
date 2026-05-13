# skill-creator Install (Project Scope)

## Overview
התקנת ה-skill הרשמי `skill-creator` מ-[anthropics/skills](https://github.com/anthropics/skills/tree/main/skills/skill-creator) לפרויקט, ב-**project scope** (`.claude/skills/skill-creator/`). השיטה המבוקשת היתה `claude plugin install`, אבל הסביבה הזו לא חושפת CLI של Claude Code — אז ההתקנה בוצעה ידנית דרך GitHub Contents API.

## Open Questions
- אם בעתיד יהיה `claude` CLI זמין בסביבה, להחליף את ההתקנה הידנית בהתקנת plugin רשמית? (מקל על שדרוגים)
- האם נרצה להתקין גם skills נוספים מאותו ריפו (פה: `claude-api`, `mcp-builder`, `webapp-testing`, ועוד) ב-project scope?

## Session Log

### 2026-05-13 — skill-creator install via direct GitHub fetch [shipped]
- **What was done:**
  - ניסיתי `claude plugin install skill-creator@claude-plugins-official --scope project` — נכשל; ה-CLI לא נמצא ב-PATH (לא ב-bash, לא ב-PowerShell, ולא בנתיבי ההתקנה הסטנדרטיים).
  - חיפוש החלופה: GitHub Contents API → רקורסיה דרך `skills/skill-creator/` והורדה של כל קובץ ל-`.claude/skills/skill-creator/`.
  - 18 קבצים הותקנו: `SKILL.md`, `LICENSE.txt`, `agents/` (3), `assets/` (1), `eval-viewer/` (2), `references/` (1), `scripts/` (8).
  - אומת שה-harness זיהה את ה-skill: `skill-creator` מופיע ברשימת ה-skills הזמינים בלי הקידומת `anthropic-skills:` (זו של ה-plugin הגלובלי).
  - Commit `4e9d768` ו-push ל-`main` הצליחו (origin: enigma-s/the-five-agent).
- **Decisions:**
  - **התקנה ידנית מ-GitHub API** במקום plugin install — בחרת באפשרות הזו אחרי שגיליתי שה-CLI לא זמין.
  - **scope project** — הקבצים פיזית ב-`.claude/skills/skill-creator/` בתוך הריפו, כך שכל מי שעובד בריפו מקבל את ה-skill אוטומטית.
  - **Commit memokad** — רק לקבצי `.claude/skills/skill-creator/`, לא לקבצים הלא-מעוקבים האחרים (`vault/`, `.obsidian/`, שאר ה-obsidian skills), כי אלו עבודות נפרדות שלא ביקשת לקבע כעת.
- **Notes / Caveats:**
  - **תקרית sparse-checkout:** ניסיון ראשון של sparse-clone נכשל בגלל שהנתיב הזמני (`$env:TEMP`) מכיל short-name של תיקיית משתמש בעברית — `Push-Location` נכשל, ו-`git sparse-checkout set` רץ בטעות על הריפו של הפרויקט שלנו. תוצאה: working tree של הפרויקט הצטמצם ל-7% (קבצים עקובים נעלמו זמנית מהדיסק). שוחזר עם `git sparse-checkout disable` — לא נכתב commit פגום ולא אבדה עבודה. בעתיד: להשתמש ב-`git -C "$path"` במקום `cd`/`Push-Location` כשהנתיב מכיל תווים בעייתיים.
  - אזהרות `LF will be replaced by CRLF` — סטנדרטי ב-Windows, לא בעיה.
  - ה-skill `anthropic-skills:skill-creator` עדיין זמין במקביל מה-plugin הגלובלי — שני העתקים יחיו זה לצד זה. ה-`skill-creator` (בלי prefix) הוא ה-project scope.
- **Related:** [[claude-md]], [[skill-creator]], [[Skills/_index|Skills index]], [[using-superpowers]], [[writing-skills]], [[vault-initialization]]
