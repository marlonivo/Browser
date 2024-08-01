#!/bin/bash

# Verzeichnisse erstellen, falls nicht vorhanden
mkdir -p ~/.mozilla/firefox/*.default-release/chrome

# Dateien kopieren
cp -r chrome ~/.mozilla/firefox/*.default-release/
cp prefs.js ~/.mozilla/firefox/*.default-release/
cp user.js ~/.mozilla/firefox/*.default-release/

# Add-ons installieren (Beispielhaft)
firefox "https://addons.mozilla.org/firefox/downloads/file/3784780/ublock_origin-1.38.6-an+fx.xpi"
firefox "https://addons.mozilla.org/firefox/downloads/file/3786550/vimium_c-1.92.5-an+fx.xpi"
firefox "https://addons.mozilla.org/firefox/downloads/file/3788321/stylus-1.5.10-an+fx.xpi"

echo "Installation abgeschlossen. Bitte Firefox neu starten."

