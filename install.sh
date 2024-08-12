#!/bin/sh

# Makefile für das unifox.js Projekt
PROFILE_NAME="unifox"
PROFILE_DIR=$(HOME)/.mozilla/firefox

# Neues Profil erstellen
firefox -CreateProfile "$PROFILE_NAME"

# Pfad des neuen Profils ermitteln
NEW_PROFILE_PATH=$(grep -oP "(?<=^Path=).*$" "$PROFILE_DIR/profiles.ini" | grep "$PROFILE_NAME")

# Notwendige Verzeichnisse erstellen
mkdir -p "$PROFILE_DIR/$NEW_PROFILE_PATH/chrome"
mkdir -p "$PROFILE_DIR/$NEW_PROFILE_PATH/chrome/img"

# Konfigurationsdateien kopieren
cp -r chrome "$PROFILE_DIR/$NEW_PROFILE_PATH/"
cp prefs.js "$PROFILE_DIR/$NEW_PROFILE_PATH/"
cp addons.json "$PROFILE_DIR/$NEW_PROFILE_PATH/"

# Add-ons installieren und konfigurieren
ADDON_LIST="ublock-origin decentraleyes istilldontcareaboutcookies vimimium-c"
ADDON_TMP=$(mktemp -d)
for ADDON in $ADDON_LIST; do
    if [ "$ADDON" = "ublock-origin" ]; then
        ADDON_URL=$(curl -sL https://api.github.com/repos/gorhill/uBlock/releases/latest | grep -E 'browser_download_url.*\.firefox\.xpi' | cut -d '"' -f 4)
    else
        ADDON_URL=$(curl --silent "https://addons.mozilla.org/en-US/firefox/addon/$ADDON/" | grep -o 'https://addons.mozilla.org/firefox/downloads/file/[^"]*')
    fi
    FILE=$(basename "$ADDON_URL")
    curl -LOs "$ADDON_URL" -o "$ADDON_TMP/$FILE"
    ID=$(unzip -p "$ADDON_TMP/$FILE" manifest.json | grep "\"id\"" | sed 's/\"//g')
    mv "$ADDON_TMP/$FILE" "$PROFILE_DIR/$NEW_PROFILE_PATH/extensions/$ID.xpi"
done

# Hintergrundbild kopieren
cp /path/to/custom/background.png "$PROFILE_DIR/$NEW_PROFILE_PATH/chrome/img/background.png"

# Finale Konfiguration
echo "user_pref('toolkit.legacyUserProfileCustomizations.stylesheets', true);" >> "$PROFILE_DIR/$NEW_PROFILE_PATH/prefs.js"

echo "Firefox setup for profile $PROFILE_NAME completed."
