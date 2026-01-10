<#
Safe compile script for array.cpp
Usage: In PowerShell run: .\compile.ps1
#>
$src = Join-Path $PSScriptRoot 'array.cpp'
$out = Join-Path $PSScriptRoot 'array.exe'

$explicit = 'C:\msys64\mingw64\bin\g++.exe'
if (Test-Path $explicit) {
    $compiler = $explicit
} elseif (Get-Command g++ -ErrorAction SilentlyContinue) {
    $compiler = 'g++'
} else {
    Write-Host 'No g++ found. Install MSYS2 (mingw-w64) or add g++ to PATH.' -ForegroundColor Red
    exit 1
}

Write-Host "Using compiler: $compiler"
& $compiler $src -o $out
if ($LASTEXITCODE -ne 0) {
    Write-Host 'Compilation failed.' -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host '--- Compilation succeeded ---' -ForegroundColor Green
& $out
