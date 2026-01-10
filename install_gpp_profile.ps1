$profilePath = $PROFILE
$profileDir = Split-Path -Parent $profilePath
if (-not (Test-Path $profileDir)) { New-Item -ItemType Directory -Path $profileDir -Force | Out-Null }
if (-not (Test-Path $profilePath)) { New-Item -ItemType File -Path $profilePath -Force | Out-Null }
$marker = '# gpp helper (added by script)'
$srcPath = 'C:\Users\vkani\OneDrive\Desktop\dsa practice\ps_functions.ps1'
if (-not (Get-Content $profilePath -ErrorAction SilentlyContinue | Select-String -Pattern ([regex]::Escape($marker)) -Quiet)) {
    Add-Content -Path $profilePath -Value "`n$marker`n. '$srcPath'`n"
    Write-Host 'Appended helper to profile'
} else {
    Write-Host 'Profile already contains helper'
}
