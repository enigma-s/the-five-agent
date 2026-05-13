$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

# Load .env from current directory
$apiKey = $null
Get-Content .env | ForEach-Object {
    if ($_ -match '^\s*OPENAI_API_KEY\s*=\s*(.+?)\s*$') {
        $apiKey = $matches[1].Trim('"').Trim("'")
    }
}
if (-not $apiKey) { Write-Error "no OPENAI_API_KEY in .env"; exit 1 }

$prompt = "Editorial photograph, dark moody home office at late night. A single laptop screen glows with lines of code reflected on the face of a focused man in his forties wearing a hoodie. A coffee mug sits half-empty beside him. Through the window behind him, the skyline of Tel Aviv is visible at dawn - soft blue and orange light bleeding into the room. Photorealistic, shallow depth of field, cinematic color grading reminiscent of The New York Times tech features. Mood: quiet revolution, the calm before disruption. No text or logos visible."

$outputPath = "yuval/outputs/2026-05-13-nocode-crm-israel-hero.png"
$txtPath    = "yuval/outputs/2026-05-13-nocode-crm-israel-hero.txt"

New-Item -ItemType Directory -Force -Path (Split-Path $outputPath) | Out-Null

$payload = @{
    model         = "gpt-image-2"
    prompt        = $prompt
    size          = "1536x1024"
    quality       = "high"
    output_format = "png"
} | ConvertTo-Json -Compress

$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Content-Type"  = "application/json"
}

Write-Host "Calling OpenAI Images API (gpt-image-2)..."
try {
    $resp = Invoke-RestMethod -Method Post `
        -Uri "https://api.openai.com/v1/images/generations" `
        -Headers $headers `
        -Body $payload `
        -TimeoutSec 300
} catch {
    Write-Host "HTTP error:" -ForegroundColor Red
    Write-Host $_.Exception.Message
    if ($_.ErrorDetails) { Write-Host $_.ErrorDetails.Message }
    exit 1
}

if (-not $resp.data) {
    Write-Host "API returned no data:" -ForegroundColor Red
    $resp | ConvertTo-Json -Depth 10
    exit 1
}

$b64 = $resp.data[0].b64_json
[IO.File]::WriteAllBytes((Join-Path (Get-Location) $outputPath), [Convert]::FromBase64String($b64))
Set-Content -Path $txtPath -Value $prompt -Encoding UTF8 -NoNewline

$size = (Get-Item $outputPath).Length
$absPath = (Resolve-Path $outputPath).Path
Write-Host ""
Write-Host "OK"
Write-Host "PATH: $absPath"
Write-Host "SIZE: $size bytes"
