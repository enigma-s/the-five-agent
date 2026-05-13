# verification-before-completion

## Overview
טענת "הסתיים / תוקן / עובר" בלי הרצה טרייה של פקודת אימות = חוסר יושר, לא יעילות. הצדק הברזלי: **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**.

## Source path
`.claude/skills/verification-before-completion/SKILL.md`

## When to invoke
לפני כל טענת השלמה, לפני commit, לפני יצירת PR, לפני אמירה "זה עובד".

## Gate function
1. IDENTIFY: איזו פקודה מוכיחה את הטענה?
2. RUN: להריץ את הפקודה המלאה (טרי, שלם)
3. ANALYZE: לקרוא את הפלט
4. CLAIM: רק עכשיו אפשר להגיד "הסתיים"

## Owned/used by
- [[reuven]] — חובה לפני כל סגירת משימה
- [[yael]], [[yuval]], [[chen]] — שכל אחד יוכיח שהתוצר שלו תקין

## Related
- [[test-driven-development]] — מקור הבדיקות שנריץ כ-verification
- [[systematic-debugging]] — אחיו: שניהם דורשים ראיות, לא ספקולציה
- [[finishing-a-development-branch]] — נכנס ל-Step 1 שם
- [[receiving-code-review]] — לאחר תיקון פידבק, חובה לאמת מחדש
