# dispatching-parallel-agents

## Overview
שיגור מספר subagents במקביל למשימות עצמאיות (בלי תלות חיתוך-מצב או רצף). חוסך זמן ושומר על ההקשר של ה-agent הראשי.

## Source path
`.claude/skills/dispatching-parallel-agents/SKILL.md`

## When to invoke
כשיש 2 או יותר משימות עצמאיות (כשלי בדיקה שונים, חקירות בתת-מערכות שונות, באגים שאינם קשורים).

## Core principle
"Dispatch one agent per independent problem domain. Let them work concurrently."

## Owned/used by
- [[reuven]] — בעיקר, כשמגיעות מספר בקשות עצמאיות באותו זמן

## Related
- [[subagent-driven-development]] — קרוב; ההבדל הוא שזה לבעיות עצמאיות, השני לתכנית מובנית
- [[executing-plans]] — חלופה רציפה למשימות תלויות
- [[using-superpowers]] — איך מוצאים את ה-skill הזה
