# writing-skills

## Overview
**יצירת skills כ-Test-Driven Development.** כותבים pressure scenarios (תרחישי לחץ עם subagents), רואים אותם נכשלים (baseline), כותבים את ה-skill (תיעוד), רואים אותם עוברים (agents מצייתים), refactor (סוגרים פרצות). **אם לא צפית ב-agent נכשל בלי ה-skill — אתה לא יודע אם הוא מלמד את הדבר הנכון.**

## Source path
`.claude/skills/writing-skills/SKILL.md` (+ anthropic-best-practices.md, persuasion-principles.md, render-graphs.js, examples/)

## When to invoke
ביצירת skill חדש, עריכת skill קיים, או אימות שה-skill עובד.

## Required background
חובה להבין את [[test-driven-development]] קודם — הוא מגדיר את מחזור RED-GREEN-REFACTOR.

## Owned/used by
- [[reuven]] — כשמוסיף יכולת חדשה לצוות

## Related
- [[test-driven-development]] — הבסיס; כל ה-skill בנוי עליו
- [[brainstorming]] — לעצב את ה-skill לפני שכותבים אותו
- [[using-superpowers]] — ה-skill שמסביר איך אחרים ימצאו את ה-skill שכתבת
