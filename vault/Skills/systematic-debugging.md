# systematic-debugging

## Overview
פרוטוקול חובה לכל באג, כשל בדיקה, או התנהגות בלתי צפויה — לפני הצעת תיקונים. הצדק הברזלי: **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**. תיקוני סימפטומים = כישלון.

## Source path
`.claude/skills/systematic-debugging/SKILL.md` (+ root-cause-tracing.md, defense-in-depth.md, condition-based-waiting.md, find-polluter.sh, ועוד)

## When to invoke
כל בעיה טכנית: כשלי בדיקה, באגים בפרודקשן, התנהגות בלתי צפויה, בעיות ביצועים.

## Owned/used by
- [[reuven]] — כל פעם שיש כשל
- [[yael]], [[yuval]], [[chen]] — כשהתוצר שלהם לא יוצא כצפוי

## Related
- [[test-driven-development]] — בדיקה ש"reproduce-ת" את הבאג היא Phase 1
- [[verification-before-completion]] — אימות שהתיקון באמת פותר
- [[receiving-code-review]] — אם הפידבק מצביע על באג
- [[brainstorming]] — לא כאן; debugging הוא reactive, brainstorming הוא proactive
