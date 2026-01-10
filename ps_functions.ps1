function gpp {
    param([string]$file)
    if (-not $file) {
        Write-Host 'Usage: gpp <file.cpp>' -ForegroundColor Yellow
        return
    }
    if (-not (Test-Path $file)) {
        Write-Host "File not found: $file" -ForegroundColor Red
        return
    }
    $src = (Get-Item $file).FullName
    $base = [System.IO.Path]::GetFileNameWithoutExtension($file)
    $out = Join-Path (Get-Location) ($base + '.exe')
    $explicit = 'C:\msys64\mingw64\bin\g++.exe'
    if (Test-Path $explicit) { $compiler = $explicit } elseif (Get-Command g++ -ErrorAction SilentlyContinue) { $compiler = 'g++' } else {
        Write-Host 'No g++ found. Install MSYS2 (mingw-w64) or add g++ to PATH.' -ForegroundColor Red
        return
    }
    Write-Host "Using compiler: $compiler"
    & $compiler $src -o $out
    if ($LASTEXITCODE -ne 0) { Write-Host 'Compilation failed.' -ForegroundColor Red; return }
    Write-Host '--- Compilation succeeded ---' -ForegroundColor Green
    & $out
}

# End of helper
