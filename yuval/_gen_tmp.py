import os, json, base64, urllib.request, sys

api_key = os.environ["OPENAI_API_KEY"]
prompt = (
    "Abstract conceptual illustration, editorial magazine style. A massive "
    "crystalline glass tower made of stacked transparent panels — each panel "
    "representing a SaaS dashboard with faint UI elements — slowly cracking "
    "and dissolving into thousands of small glowing particles that drift away "
    "on a digital wind. In the foreground, a small silhouetted figure holds a "
    "single glowing orb that contains the same dashboard, miniaturized and "
    "personal. Background: gradient of deep purple to electric teal, "
    "suggesting both threat and possibility. Style: somewhere between a "
    "sophisticated NYT op-ed illustration and a science-fiction book cover. "
    "No text, no readable UI elements, no logos."
)
output_path = sys.argv[1]

body = json.dumps({
    "model": "gpt-image-2",
    "prompt": prompt,
    "size": "1536x1024",
    "quality": "high",
    "output_format": "png",
}).encode("utf-8")

req = urllib.request.Request(
    "https://api.openai.com/v1/images/generations",
    data=body,
    headers={
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    },
    method="POST",
)

try:
    with urllib.request.urlopen(req, timeout=300) as resp:
        d = json.loads(resp.read().decode("utf-8"))
except urllib.error.HTTPError as e:
    print("HTTP error:", e.code, e.read().decode("utf-8"), file=sys.stderr)
    sys.exit(1)

if "data" not in d:
    print("API error:", json.dumps(d, indent=2), file=sys.stderr)
    sys.exit(1)

with open(output_path, "wb") as f:
    f.write(base64.b64decode(d["data"][0]["b64_json"]))

print(f"OK: wrote {output_path} ({os.path.getsize(output_path)} bytes)")
