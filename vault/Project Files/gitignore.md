# .gitignore — חוקי הסתרה מ-Git

## Overview
מגדיר אילו קבצים ותיקיות **לא** נכנסים ל-Git. המטרה העיקרית היא להגן על סודות (`.env`) ולשמור את הריפו נקי מקבצי מערכת ולוגים.

## File path
`.gitignore`

## Belongs to
תשתית משותפת.

## What it ignores
- **סודות:** `.env`, `.env.local`, `.env.*.local` — אבל **לא** `.env.example` (יש חריג `!.env.example`)
- **OS / Editor:** `Thumbs.db`, `Desktop.ini`, `.DS_Store`, `.vscode/`, `.idea/`
- **Logs:** `*.log`, `npm-debug.log*`

## Related
- [[env]] — הקובץ העיקרי שהקובץ הזה מגן עליו
- [[env-example]] — לא מוסתר (יש לו חריג מפורש)
