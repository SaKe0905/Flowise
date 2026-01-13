@echo off
REM Background Check WebApp Starter for Windows
REM Startet automatisch die WebApp im Browser

setlocal enabledelayedexpansion

set PROJECT_DIR=%~dp0
set PORT=8000
set APP_FILE=background-check-webapp.html

echo.
echo 🚀 Starte Vereinsmitglied Background Check WebApp...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

cd /d "%PROJECT_DIR%"

echo ✓ Starte Web-Server auf Port %PORT%...

REM Starte Python HTTP Server
python -m http.server %PORT% >nul 2>&1 &

REM Warte kurz
timeout /t 2 /nobreak >nul

set URL=http://localhost:%PORT%/%APP_FILE%

echo ✓ Öffne Chrome mit WebApp...
echo 🌐 URL: %URL%
echo.

REM Versuche Chrome zu öffnen
for %%i in (chrome.exe) do (
    if "%%~$PATH:i"=="" (
        for %%j in ("C:\Program Files\Google\Chrome\Application\chrome.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe") do (
            if exist "%%j" (
                start "" "%%j" "%URL%"
                goto :opened
            )
        )
    ) else (
        start chrome.exe "%URL%"
        goto :opened
    )
)

:opened
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ WebApp läuft auf: %URL%
echo.
echo Server läuft im Hintergrund.
echo Schließen Sie dieses Fenster um den Server zu beenden.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

REM Halte Fenster offen
pause
