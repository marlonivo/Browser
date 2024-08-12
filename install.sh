#!/bin/sh

# Makefile für das unifox.js Projekt
PROFILE_NAME="unifox"
PROFILE_DIR="$HOME/.mozilla/firefox"

# Überprüfen, ob notwendige Werkzeuge installiert sind
command -v firefox >/dev/null 2>&1 || { echo >&2 "Firefox ist nicht installiert. Abbruch."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "curl ist nicht installiert. Abbruch."; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo >&2 "unzip ist nicht installiert. Abbruch."; exit 1; }
command -v mkdir >/dev/null 2>&1 || { echo >&2 "mkdir ist nicht installiert. Abbruch."; exit 1; }
command -v cp >/dev/null 2>&1 || { echo >&2 "cp ist nicht installiert. Abbruch."; exit 1; }
command -v mv >/dev/null 2>&1 || { echo >&2 "mv ist nicht installiert. Abbruch."; exit 1; }

# Neues Profil erstellen
firefox -CreateProfile "$PROFILE_NAME" || { echo >&2 "Fehler beim Erstellen des Profils. Abbruch."; exit 1; }

# Pfad des neuen Profils ermitteln
NEW_PROFILE_PATH=$(grep -oP "(?<=^Path=).*$" "$PROFILE_DIR/profiles.ini" | grep "$PROFILE_NAME") || { echo >&2 "Profilpfad konnte nicht ermittelt werden. Abbruch."; exit 1; }

# Notwendige Verzeichnisse erstellen
mkdir -p "$PROFILE_DIR/$NEW_PROFILE_PATH/chrome"
mkdir -p "$PROFILE_DIR/$NEW_PROFILE_PATH/chrome/img"

# Konfigurationsdateien kopieren
cp -r chrome "$PROFILE_DIR/$NEW_PROFILE_PATH/" || { echo >&2 "Fehler beim Kopieren der Konfigurationsdateien. Abbruch."; exit 1; }
cp prefs.js "$PROFILE_DIR/$NEW_PROFILE_PATH/" || { echo >&2 "Fehler beim Kopieren von prefs.js. Abbruch."; exit 1; }
cp addons.json "$PROFILE_DIR/$NEW_PROFILE_PATH/" || { echo >&2 "Fehler beim Kopieren von addons.json. Abbruch."; exit 1; }

# Add-ons installieren und konfigurieren
ADDON_LIST="ublock-origin decentraleyes istilldontcareaboutcookies vimimium-c"
ADDON_TMP=$(mktemp -d) || { echo >&2 "Fehler beim Erstellen eines temporären Verzeichnisses. Abbruch."; exit 1; }
for ADDON in $ADDON_LIST; do
    if [ "$ADDON" = "ublock-origin" ]; then
        ADDON_URL=$(curl -sL https://api.github.com/repos/gorhill/uBlock/releases/latest | grep -E 'browser_download_url.*\.firefox\.xpi' | cut -d '"' -f 4)
    else
        ADDON_URL=$(curl --silent "https://addons.mozilla.org/en-US/firefox/addon/$ADDON/" | grep -o 'https://addons.mozilla.org/firefox/downloads/file/[^"]*')
    fi
    FILE=$(basename "$ADDON_URL")
    curl -LOs "$ADDON_URL" -o "$ADDON_TMP/$FILE" || { echo >&2 "Fehler beim Herunterladen des Add-ons $ADDON. Abbruch."; exit 1; }
    ID=$(unzip -p "$ADDON_TMP/$FILE" manifest.json | grep "\"id\"" | sed 's/\"//g') || { echo >&2 "Fehler beim Extrahieren der ID des Add-ons $ADDON. Abbruch."; exit 1; }
    mkdir -p "$PROFILE_DIR/$NEW_PROFILE_PATH/extensions"
    mv "$ADDON_TMP/$FILE" "$PROFILE_DIR/$NEW_PROFILE_PATH/extensions/$ID.xpi" || { echo >&2 "Fehler beim Verschieben des Add-ons $ADDON. Abbruch."; exit 1; }
done

# Hintergrundbild kopieren
cp /path/to/custom/background.png "$PROFILE_DIR/$NEW_PROFILE_PATH/chrome/img/background.png" || { echo >&2 "Fehler beim Kopieren des Hintergrundbilds. Abbruch."; exit 1; }

# Finale Konfiguration
echo "user_pref('toolkit.legacyUserProfileCustomizations.stylesheets', true);" >> "$PROFILE_DIR/$NEW_PROFILE_PATH/prefs.js" || { echo >&2 "Fehler beim Aktualisieren von prefs.js. Abbruch."; exit 1; }

echo "Firefox setup for profile $PROFILE_NAME completed."
