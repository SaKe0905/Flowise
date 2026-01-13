#!/bin/bash

# Background Check WebApp Starter Script
# Startet automatisch die WebApp im Browser

PROJECT_DIR="/home/user/Flowise"
PORT=8000
APP_FILE="background-check-webapp.html"

echo "🚀 Starte Vereinsmitglied Background Check WebApp..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Wechsel ins Projekt-Verzeichnis
cd "$PROJECT_DIR" || exit 1

# Starte Python HTTP Server im Hintergrund
echo "✓ Starte Web-Server auf Port $PORT..."
python3 -m http.server $PORT > /dev/null 2>&1 &
SERVER_PID=$!

# Warte kurz, bis Server lädt
sleep 2

# Öffne Chrome mit der WebApp
URL="http://localhost:$PORT/$APP_FILE"
echo "✓ Öffne Chrome mit WebApp..."
echo "🌐 URL: $URL"

# Versuche Chrome zu öffnen (verschiedene Betriebssysteme)
if command -v google-chrome &> /dev/null; then
    google-chrome "$URL" &
elif command -v chromium &> /dev/null; then
    chromium "$URL" &
elif command -v chromium-browser &> /dev/null; then
    chromium-browser "$URL" &
else
    echo "⚠️  Chrome/Chromium nicht gefunden. Öffne manuell:"
    echo "   $URL"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ WebApp läuft auf: $URL"
echo ""
echo "Server läuft im Hintergrund (PID: $SERVER_PID)"
echo "Zum Stoppen: kill $SERVER_PID"
echo ""
echo "Drücke Ctrl+C um den Server zu beenden."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Warte auf Ctrl+C und stoppe dann Server
trap "kill $SERVER_PID; echo ''; echo '✓ Server gestoppt.'; exit 0" INT

# Halte den Server am Laufen
wait $SERVER_PID
