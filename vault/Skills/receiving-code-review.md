# receiving-code-review

## Overview
איך מקבלים פידבק על קוד בלי הסכמה מבוייסת. דורש קריאה מלאה, שחזור הדרישה במילים שלי, אימות מול הקוד, הערכה טכנית, ורק אז יישום או pushback מנומק.

## Source path
`.claude/skills/receiving-code-review/SKILL.md` (+ code-reviewer.md אצל requesting)

## When to invoke
בקבלת פידבק על code review — במיוחד כשהפידבק לא ברור או נראה שגוי טכנית.

## Forbidden responses
"You're absolutely right!" — הפרה מפורשת של CLAUDE.md. נדרשת הערכה טכנית, לא ביצוע חברתי.

## Owned/used by
- [[reuven]] — כשמקבל review מסוכן אחר או מ-subagent
- [[yael]], [[yuval]], [[chen]] — בכל סבב משוב

## Related
- [[requesting-code-review]] — הצד השני (איך מבקשים)
- [[systematic-debugging]] — אם הפידבק מצביע על באג
- [[verification-before-completion]] — אימות שהיישום אכן פותר את הפידבק
