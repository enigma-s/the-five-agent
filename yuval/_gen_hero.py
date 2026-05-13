import json, base64, os, sys, urllib.request

prompt = """Editorial photograph, dark moody home office at late night. A single laptop screen glows with lines of code reflected on the face of a focused man in his forties wearing a hoodie. A coffee mug sits half-empty beside him. Through the window behind him, the skyline of Tel Aviv is visible at dawn — soft blue and orange light bleeding into the room. Photorealistic, shallow depth of field, cinematic color grading reminiscent of The New York Times tech features. Mood: quiet revolution, the calm before disruption. No text or logos visible."""

output_path = "yuval/outputs/2026-05-13-nocode-crm-israel-hero.png"

api_key = os.environ.get("OPENAI_API_KEY")
if not api_key:
    # try load .env
    with open(".env", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if line.startswith("OPENAI_API_KEY"):
                api_key = line.split("=", 1)[1].strip().strip('"').strip("'")
                break

if not api_key:
    print("ERROR: no OPENAI_API_KEY", file=sys.stderr); sys.exit(1)

payload = {
    "model": "gpt-image-2",
    "prompt": prompt,
    "size": "1536x1024",
    "quality": "high",
    "output_format": "png",
}

req = urllib.request.Request(
    "https://api.openai.com/v1/images/generations",
    data=json.dumps(payload).encode("utf-8"),
    headers={
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    },
    method="POST",
)

try:
    with urllib.request.urlopen(req, timeout=300) as resp:
        body = resp.read().decode("utf-8")
except urllib.error.HTTPError as e:
    err = e.read().decode("utf-8", errors="replace")
    print(f"HTTP {e.code}: {err}", file=sys.stderr)
    sys.exit(1)

d = json.loads(body)
if "data" not in d:
    print("API error:", json.dumps(d, indent=2), file=sys.stderr); sys.exit(1)

os.makedirs(os.path.dirname(output_path), exist_ok=True)
with open(output_path, "wb") as out:
    out.write(base64.b64decode(d["data"][0]["b64_json"]))

# sibling .txt with prompt
txt_path = output_path.rsplit(".", 1)[0] + ".txt"
with open(txt_path, "w", encoding="utf-8") as f:
    f.write(prompt)

size = os.path.getsize(output_path)
print(f"OK: {output_path} ({size} bytes)")
print(f"PROMPT_FILE: {txt_path}")
