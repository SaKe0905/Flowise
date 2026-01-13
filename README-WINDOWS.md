# 🚀 Background Check WebApp - Windows 11 Installation

## Schritt 1: Dateien auf Windows kopieren

Du brauchst folgende 2 Dateien von Linux auf deinen Windows 11 PC:
- `background-check-webapp.html`
- `index.html`
- `start-background-check.bat`

### Schnellste Methode: Über ZIP

**Auf deinem Linux-System ausführen:**
```bash
cd /home/user/Flowise
zip -r background-check-webapp.zip background-check-webapp.html index.html start-background-check.bat
```

Dann die Datei `background-check-webapp.zip` auf deinen Windows-PC kopieren (USB, Cloud, FTP, etc.)

---

## Schritt 2: Auf Windows 11 entzippen

1. Rechtsklick auf `background-check-webapp.zip`
2. **Alle extrahieren** → Ordner auswählen (z.B. `C:\Users\[DeinName]\Desktop\background-check`)
3. Fertig!

---

## Schritt 3: WebApp starten

Es gibt mehrere Optionen:

### **Option A: Mit Batch-Skript (einfachste)**
1. Doppelklick auf `start-background-check.bat`
2. ✅ Chrome öffnet sich automatisch mit der WebApp

### **Option B: Manuelle CMD-Methode**
1. Öffne **CMD** (Windows-Taste + R, dann `cmd`)
2. Gehe zum Ordner:
   ```cmd
   cd C:\Users\[DeinName]\Desktop\background-check
   ```
3. Starte Server:
   ```cmd
   python -m http.server 8000
   ```
4. Öffne im Browser:
   ```
   http://localhost:8000
   ```

### **Option C: Direkt im Browser öffnen**
1. Öffne eine HTML-Datei einfach per Doppelklick
2. Die WebApp funktioniert auch offline!

---

## ✅ Systemanforderungen für Windows 11

- ✓ Python 3.x (normalerweise vorhanden)
- ✓ Chrome/Edge Browser (empfohlen)
- ✓ Keine weitere Installation nötig!

---

## 🔧 Troubleshooting

### "Python nicht erkannt"
→ [Python installieren](https://www.python.org/downloads/) und Haken bei "Add Python to PATH" setzen

### "Port 8000 wird bereits verwendet"
→ Anderen Port nutzen (z.B. 8001):
```cmd
python -m http.server 8001
```
Dann: `http://localhost:8001`

### Chrome öffnet sich nicht automatisch
→ Browser manuell öffnen und `http://localhost:8000` eingeben

---

## 📋 Nutzung der WebApp

1. **Name eingeben** (erforderlich)
2. **E-Mail** (optional)
3. **Adresse** (optional)
4. **"Suche starten"** klicken
5. Suchlinks öffnen sich in neuen Tabs
6. Ergebnisse durchsuchen und sammeln

---

## ⚠️ Wichtig

- **Nur legale, öffentliche Datenquellen**
- **Mit Einwilligung der Person nutzen**
- **DSGVO-konform verwenden**
- **Datenschutzgesetze beachten**

---

Viel Erfolg bei der Recherche! 🎯
