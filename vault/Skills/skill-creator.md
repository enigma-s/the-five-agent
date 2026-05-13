# skill-creator

## Overview
ה-skill הרשמי של Anthropic ליצירה, עריכה והערכה של skills חדשים. כולל סוכני eval (analyzer / comparator / grader), סקריפטים להרצת evals וניתוח שונות, תצוגת HTML של תוצאות, ותבניות. **חופף ל-[[writing-skills]] בגישה אבל מספק כלי-עבודה מוכנים ומלא יותר** (writing-skills מתמקד ב-TDD-לסקילים; skill-creator מוסיף packaging, evals, automation).

## Source path
`.claude/skills/skill-creator/SKILL.md` (+ agents/, assets/, eval-viewer/, references/, scripts/)

## Provenance
מקור: [anthropics/skills@main, skills/skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator). הותקן ב-2026-05-13 — ראה [[skill-creator-install]] לפרטים על התהליך.

## Scope
**project** — ב-`.claude/skills/` של הריפו. כל מי שעובד בריפו מקבל את ה-skill אוטומטית.

> **הערה:** בנוסף ל-project-scope הזה, ה-skill קיים גם כ-`anthropic-skills:skill-creator` ב-plugin הגלובלי. השניים חיים זה לצד זה.

## When to invoke
- יצירת skill חדש מאפס
- עריכה ושיפור של skill קיים
- הרצת evals (תרחישי לחץ) על skill
- benchmarking של ביצועי skill עם ניתוח שונות
- אופטימיזציה של description של skill לשיפור דיוק triggering

## What's inside
- **SKILL.md** — המסמך הראשי
- **agents/** — 3 sub-prompts: `analyzer`, `comparator`, `grader`
- **scripts/** — 8 סקריפטי Python: `run_eval.py`, `run_loop.py`, `aggregate_benchmark.py`, `generate_report.py`, `improve_description.py`, `package_skill.py`, `quick_validate.py`, `utils.py`
- **eval-viewer/** — `viewer.html` + `generate_review.py` להצגת תוצאות eval
- **assets/** — `eval_review.html`
- **references/** — `schemas.md`

## Owned/used by
- [[reuven]] — כשמוסיף יכולת חדשה לצוות, או משפר אחת קיימת
- מועמדים עתידיים: [[yael]], [[yuval]], [[chen]] — אם הם יקבלו skills ייעודיים משלהם

## Related
- [[writing-skills]] — ה-skill האחר ליצירת skills (TDD-focused); משלים את skill-creator
- [[test-driven-development]] — הבסיס לשני ה-skills האלו
- [[using-superpowers]] — איך ה-skill הזה נמצא ומוטען
- [[skill-creator-install]] — Session Log של ההתקנה
- [[brainstorming]] — לעצב את ה-skill לפני שכותבים אותו
