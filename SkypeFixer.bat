@echo off
:: This script blocks Skype from auto-updating by creating a dummy folder
echo Applying Skype 5.x-7.x Update Block...

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$tempPath = Join-Path $env:LOCALAPPDATA 'Temp\SkypeSetup.exe';" ^
    "if (Test-Path $tempPath) { Remove-Item $tempPath -Force -Recurse };" ^
    "New-Item -ItemType Directory -Path $tempPath -Force;"

echo Done! Skype cannot overwrite the dummy folder with an update.
pause