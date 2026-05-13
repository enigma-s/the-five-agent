$ErrorActionPreference = "Stop"

$envPath = Join-Path $PSScriptRoot "..\.env"
if (Test-Path $envPath) {
    Get-Content $envPath | ForEach-Object {
        if ($_ -match '^\s*([^#=]+?)\s*=\s*(.*)\s*$') {
            $name = $matches[1]
            $value = $matches[2].Trim('"').Trim("'")
            [Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }
}

$apiKey = $env:OPENAI_API_KEY
if (-not $apiKey) {
    Write-Error "OPENAI_API_KEY not set"
    exit 1
}

$outputPath = $args[0]
if (-not $outputPath) {
    Write-Error "Usage: _gen_blocks.ps1 <output_path>"
    exit 1
}

$prompt = "Conceptual editorial illustration in a flat vector style. A vibrant grid of interconnected blocks and modules in bold colors - coral red, teal, mustard yellow, cobalt blue - floating against a soft cream background. Lines and dotted arrows connect the blocks like a workflow diagram. The composition suggests a 'no-code' building-block aesthetic, reminiscent of monday.com and Wix marketing imagery, but with a slightly more sophisticated editorial tone (think Bloomberg Businessweek or The Economist illustrations). No text, no logos."

$body = @{
    model = "gpt-image-2"
    prompt = $prompt
    size = "1536x1024"
    quality = "high"
    output_format = "png"
} | ConvertTo-Json -Compress

$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Content-Type" = "application/json"
}

Write-Host "Calling OpenAI Images API (gpt-image-2)..."
$response = Invoke-RestMethod -Uri "https://api.openai.com/v1/images/generations" -Method Post -Headers $headers -Body $body -TimeoutSec 300

if (-not $response.data) {
    Write-Error "API error: $($response | ConvertTo-Json -Depth 5)"
    exit 1
}

$b64 = $response.data[0].b64_json
$bytes = [Convert]::FromBase64String($b64)

$outDir = Split-Path -Parent $outputPath
if ($outDir -and -not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}

[IO.File]::WriteAllBytes($outputPath, $bytes)

$size = (Get-Item $outputPath).Length
Write-Host "OK: $size bytes -> $outputPath"
