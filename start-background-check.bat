@echo off
REM Background Check WebApp Starter for Windows 11
REM Startet automatisch die WebApp im Browser

setlocal enabledelayedexpansion

set PROJECT_DIR=%~dp0
set PORT=8000
set APP_FILE=background-check-webapp.html

cls
echo.
echo 🚀 Starte Vereinsmitglied Background Check WebApp...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

cd /d "%PROJECT_DIR%"

echo ✓ Starte Web-Server auf Port %PORT%...
echo.

REM Starte Python HTTP Server im Hintergrund
start /B python -m http.server %PORT% >nul 2>&1

REM Warte kurz, bis Server lädt
timeout /t 3 /nobreak >nul

set URL=http://localhost:%PORT%/%APP_FILE%

echo ✓ Öffne Browser mit WebApp...
echo 🌐 URL: %URL%
echo.

REM Versuche Chrome zu öffnen
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" "%URL%"
    goto :browser_opened
) else if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "%URL%"
    goto :browser_opened
) else (
    REM Fallback: Default Browser
    start %URL%
    goto :browser_opened
)

:browser_opened
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ WebApp läuft jetzt!
echo.
echo 📌 URL: %URL%
echo 🔴 Server läuft im Hintergrund
echo 📋 Dieses Fenster kann geschlossen werden
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

REM Halte Fenster offen
pause
