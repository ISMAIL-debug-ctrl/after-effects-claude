# After Effects MCP installer for Windows: builds the tool, installs the panel in After Effects, and connects it to the Claude app.
$ErrorActionPreference = 'Stop'
$dir = Join-Path $PSScriptRoot 'after-effects-mcp'

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  Write-Host 'Install Node.js first (nodejs.org), then run install.cmd again.' -ForegroundColor Red; exit 1
}

Write-Host 'Building the tool...'
Push-Location $dir
npm install --silent
if ($LASTEXITCODE -ne 0) { Pop-Location; Write-Host 'npm install failed.' -ForegroundColor Red; exit 1 }
Pop-Location

$ae = Get-ChildItem 'C:\Program Files\Adobe' -Directory -Filter 'Adobe After Effects 20*' -ErrorAction SilentlyContinue |
  Sort-Object Name | Select-Object -Last 1
if (-not $ae) { Write-Host 'After Effects was not found in C:\Program Files\Adobe' -ForegroundColor Red; exit 1 }
$panels = Join-Path $ae.FullName 'Support Files\Scripts\ScriptUI Panels'
$jsx = Join-Path $dir 'build\scripts\mcp-bridge-auto.jsx'

# Copying into Program Files needs admin rights: Windows will ask you to allow it.
Write-Host 'Windows will ask for permission to copy the panel into the After Effects folder. Click Yes.'
$copy = "New-Item -ItemType Directory -Force -Path '$panels' | Out-Null; Copy-Item -Force -LiteralPath '$jsx' -Destination '$panels'"
Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile', '-Command', $copy
if (-not (Test-Path (Join-Path $panels 'mcp-bridge-auto.jsx'))) { Write-Host 'The panel was not copied (permission denied?).' -ForegroundColor Red; exit 1 }

New-Item -ItemType Directory -Force -Path (Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'ae-mcp-bridge') | Out-Null

# Claude settings: the normal install, plus the Microsoft Store install if it exists.
$cfgDirs = @(Join-Path $env:APPDATA 'Claude')
Get-ChildItem (Join-Path $env:LOCALAPPDATA 'Packages') -Directory -Filter 'Claude_*' -ErrorAction SilentlyContinue |
  ForEach-Object { $cfgDirs += Join-Path $_.FullName 'LocalCache\Roaming\Claude' }
$idx = Join-Path $dir 'build\index.js'
$utf8 = New-Object System.Text.UTF8Encoding $false
foreach ($d in $cfgDirs) {
  if (($d -ne $cfgDirs[0]) -and -not (Test-Path $d)) { continue }
  New-Item -ItemType Directory -Force -Path $d | Out-Null
  $p = Join-Path $d 'claude_desktop_config.json'
  if (Test-Path $p) { Copy-Item -Force $p "$p.backup"; $cfg = [IO.File]::ReadAllText($p) | ConvertFrom-Json }
  if (-not $cfg) { $cfg = [pscustomobject]@{} }
  if (-not $cfg.PSObject.Properties['mcpServers']) { $cfg | Add-Member -NotePropertyName mcpServers -NotePropertyValue ([pscustomobject]@{}) }
  $cfg.mcpServers | Add-Member -Force -NotePropertyName 'after-effects' -NotePropertyValue ([pscustomobject]@{ command = 'node'; args = @($idx) })
  [IO.File]::WriteAllText($p, ($cfg | ConvertTo-Json -Depth 20), $utf8)
  $cfg = $null
}

Write-Host 'Done. Quit the Claude app and open it again. In After Effects: Window > mcp-bridge-auto.jsx and turn on Auto-run commands.' -ForegroundColor Green
