#!/bin/bash

# Logdatei definieren
LOGFILE="$HOME/unifox/setup.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Global variables
PROFILE_NAME="unifox"
MOZILLA_DIR="$HOME/.mozilla/firefox"
PROFILE_PATH=""
CHROME_DIR="$HOME/unifox/chrome"
CONFIGS_DIR="$HOME/unifox/configs"
BACKGROUND_IMG="$CHROME_DIR/img/unifox.png"
USER_JS="$HOME/unifox/user.js"
EXTENSION_SETTINGS_JSON="$HOME/unifox/extension-settings.json"

# Function to log messages
log() {
    local message="$1"
    printf "%s\n" "$message" | tee -a "$LOGFILE"
}

# Function to create a new Firefox profile
create_firefox_profile() {
    firefox -CreateProfile "$PROFILE_NAME" >/dev/null 2>&1
    if ! PROFILE_PATH=$(find "$MOZILLA_DIR" -maxdepth 1 -type d -name "*.$PROFILE_NAME"); then
        log "Error: Failed to create Firefox profile."
        return 1
    fi
    log "Firefox profile '$PROFILE_NAME' created successfully at $PROFILE_PATH."
}

# Function to set up userChrome and userContent
setup_chrome_directory() {
    local chrome_profile_dir="$PROFILE_PATH/chrome"
    mkdir -p "$chrome_profile_dir"

    if ! cp "$CHROME_DIR/userChrome.css" "$CHROME_DIR/userContent.css" "$CHROME_DIR/userChrome.js" "$chrome_profile_dir/"; then
        log "Error: Failed to copy userChrome and userContent files."
        return 1
    fi
    log "Copied userChrome.css, userContent.css, and userChrome.js to $chrome_profile_dir."

    # Set up custom about:home background image
    local img_dir="$chrome_profile_dir/img"
    mkdir -p "$img_dir"

    if ! cp "$BACKGROUND_IMG" "$img_dir/"; then
        log "Error: Failed to copy background image."
        return 1
    fi
    log "Set custom about:home background image in $img_dir."
}

# Function to configure prefs.js for enabling custom stylesheets
configure_prefs_js() {
    local prefs_js_path="$PROFILE_PATH/prefs.js"

    printf 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);\n' >> "$prefs_js_path"

    if [[ $? -eq 0 ]]; then
        log "prefs.js updated successfully to enable custom stylesheets."
    else
        log "Error: Failed to update prefs.js."
        return 1
    fi
}

# Function to copy user.js and extension-settings.json
copy_user_and_extension_settings() {
    if [[ -f "$USER_JS" ]]; then
        cp "$USER_JS" "$PROFILE_PATH/user.js"
        log "Copied user.js to $PROFILE_PATH"
    else
        log "Error: user.js not found."
        return 1
    fi

    if [[ -f "$EXTENSION_SETTINGS_JSON" ]]; then
        cp "$EXTENSION_SETTINGS_JSON" "$PROFILE_PATH/extension-settings.json"
        log "Copied extension-settings.json to $PROFILE_PATH"
    else
        log "Error: extension-settings.json not found."
        return 1
    fi
}

main() {
    log "Starting Firefox autobootstrap script...please sit and relax"
    create_firefox_profile || return 1
    setup_chrome_directory || return 1
    configure_prefs_js || return 1
    copy_user_and_extension_settings || return 1
    log "Firefox profile '$PROFILE_NAME' setup is completed successfully."
}

main "$@"
