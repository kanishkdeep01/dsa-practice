Simple compile/run for `array.cpp` (Windows)

If you installed MSYS2 (mingw-w64) earlier, this project includes a safe helper script.

Steps:

- Compile & run (PowerShell):

```powershell
.\compile.ps1
```

- The script will prefer `C:\msys64\mingw64\bin\g++.exe` if present, otherwise it uses `g++` from your `PATH`.

If the script reports "No g++ found", install MSYS2 and the `mingw-w64-x86_64-toolchain` package, then re-open PowerShell.

Files:
- `array.cpp` — source
- `compile.ps1` — compile + run helper
