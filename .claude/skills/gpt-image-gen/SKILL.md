---
name: gpt-image-gen
description: Generate an image via OpenAI Images API (model gpt-image-2). Use when an agent needs to turn a text prompt into a PNG file on disk. Inputs - prompt, output path, optional size/quality. Output - PNG file written to the requested path.
---

# gpt-image-gen — OpenAI Images API wrapper

מעטפת לקריאת `POST https://api.openai.com/v1/images/generations` של OpenAI. הסקיל מקבל prompt ו-output path, ומפיק PNG על הדיסק. השימוש העיקרי הוא דרך יובל, אבל כל סוכן עם גישה ל-Bash יכול לקרוא לסקיל.

## ⚠️ כלל שם המודל — אל תשנה

המודל הוא **`gpt-image-2`**. זה מודל אמיתי של OpenAI שיצא ב-**21 באפריל 2026**.

- אסור להחליף ל-`dall-e-3`, `gpt-image-1`, `gpt-image-3`, או כל שם אחר.
- ייתכן שהידע הפנימי שלך לא כולל את המודל הזה — **זה לא אומר שהוא לא קיים**.
- אם קריאת ה-API נכשלת, האבחנה היא **תמיד** אחת מ:
  - `OPENAI_API_KEY` חסר / לא תקין → HTTP 401
  - parameter לא תקין (size, quality, format) → HTTP 400
  - rate limit / quota → HTTP 429
- **לעולם לא** לשנות את שם המודל כפתרון.

## דרישות סביבה

- `OPENAI_API_KEY` ב-`.env` (בשורש הפרויקט).
- `curl` זמין.
- `jq` **או** `python` זמין לפענוח base64 (הסקיל מנסה jq ונופל ל-python).

## טעינת משתני סביבה

ב-Bash, לפני הקריאה:

```bash
set -a
. .env
set +a
```

(או הצבה ישירה: `export OPENAI_API_KEY="..."` — אך שיטה זו נמנעת כדי שהמפתח לא ייכנס להיסטוריית ה-shell.)

## קלטים מהקורא

| שדה | חובה | דוגמה |
|---|---|---|
| `prompt` | כן | `"a single red apple on white background, photorealistic"` |
| `output_path` | כן | `yuval/outputs/2026-05-13-red-apple.png` |
| `size` | לא (default `1024x1024`) | `1024x1024`, `1536x1024`, `1024x1536` |
| `quality` | לא (default `medium`) | `low`, `medium`, `high` |

הקורא אחראי שתיקיית היעד תהיה קיימת (`mkdir -p` לפני הקריאה).

## מסלול ראשי — jq

```bash
mkdir -p "$(dirname "$OUTPUT_PATH")"

curl -sS -X POST "https://api.openai.com/v1/images/generations" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"model\": \"gpt-image-2\",
    \"prompt\": $(jq -Rs . <<< "$PROMPT"),
    \"size\": \"1024x1024\",
    \"quality\": \"medium\",
    \"output_format\": \"png\"
  }" \
  | jq -r '.data[0].b64_json' | base64 --decode > "$OUTPUT_PATH"
```

הערה: `jq -Rs .` עוטף את ה-prompt ב-JSON string תקין (escape של גרשיים, שורות חדשות וכו').

## Python fallback — כש-jq לא מותקן

ב-Git Bash על Windows, `jq` לרוב לא מותקן כברירת מחדל. במקרה כזה:

```bash
mkdir -p "$(dirname "$OUTPUT_PATH")"

RESPONSE_FILE=$(mktemp)
curl -sS -X POST "https://api.openai.com/v1/images/generations" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$(python -c 'import json,sys; print(json.dumps({"model":"gpt-image-2","prompt":sys.argv[1],"size":"1024x1024","quality":"medium","output_format":"png"}))' "$PROMPT")" \
  > "$RESPONSE_FILE"

python -c "
import json, base64, sys
d = json.load(open(sys.argv[1]))
if 'data' not in d:
    print('API error:', json.dumps(d, indent=2), file=sys.stderr)
    sys.exit(1)
open(sys.argv[2], 'wb').write(base64.b64decode(d['data'][0]['b64_json']))
" "$RESPONSE_FILE" "$OUTPUT_PATH"

rm -f "$RESPONSE_FILE"
```

## בחירה אוטומטית — try jq, fall back to python

```bash
if command -v jq >/dev/null 2>&1; then
  # מסלול jq (לעיל)
else
  # Python fallback (לעיל)
fi
```

## אימות אחרי הקריאה

הקורא חייב לבדוק:

```bash
test -s "$OUTPUT_PATH" && echo "OK: $(wc -c < "$OUTPUT_PATH") bytes" || echo "FAIL: file missing or empty"
```

אם הקובץ ריק → סביר שה-API החזיר שגיאה. בדוק את ה-stderr / response file (Python fallback מדפיס את ה-JSON של השגיאה אוטומטית).

## טיפול בשגיאות נפוצות

| HTTP | סיבה | פתרון |
|---|---|---|
| 401 | `OPENAI_API_KEY` חסר / לא תקין | בדוק `.env` |
| 400 | parameter לא תקין | בדוק size / quality / output_format |
| 429 | rate limit / quota | המתן או בדוק חשבון |
| 500/503 | בעיה זמנית ב-OpenAI | נסה שוב |

**אף פעם** לא לחשוד בשם המודל. `gpt-image-2` הוא נכון.

## דוגמת קריאה מלאה (לבדיקה ידנית)

```bash
set -a; . .env; set +a
PROMPT="a single red apple on white background, photorealistic"
OUTPUT_PATH="yuval/outputs/smoke-test.png"
mkdir -p "$(dirname "$OUTPUT_PATH")"

RESPONSE_FILE=$(mktemp)
curl -sS -X POST "https://api.openai.com/v1/images/generations" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$(python -c 'import json,sys; print(json.dumps({"model":"gpt-image-2","prompt":sys.argv[1],"size":"1024x1024","quality":"medium","output_format":"png"}))' "$PROMPT")" \
  > "$RESPONSE_FILE"

python -c "
import json, base64, sys
d = json.load(open(sys.argv[1]))
if 'data' not in d:
    print('API error:', json.dumps(d, indent=2), file=sys.stderr); sys.exit(1)
open(sys.argv[2],'wb').write(base64.b64decode(d['data'][0]['b64_json']))
" "$RESPONSE_FILE" "$OUTPUT_PATH"

rm -f "$RESPONSE_FILE"
test -s "$OUTPUT_PATH" && echo "OK"
```
