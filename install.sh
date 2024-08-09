#!/bin/sh

# Autobootstrap Script for unifox.js
# by Marlon Ivo <email@marlonivo.xyz>
# License: GNU GPLv3

### OPTIONS AND VARIABLES ###

dotfilesrepo="https://github.com/marlonivo/ricebowl.git"
progsfile="https://raw.githubusercontent.com/LukeSmithxyz/LARBS/master/static/progs.csv"
aurhelper="yay"
repobranch="master"
export TERM=ansi

### Copying addons.json, pref.js, userChrome and userContent.css
mkdir -p ~/.mozilla/firefox/*.default-release/chrome
mkdir -p ~/.mozilla/firefox/*.default-release/chrome/img
cp -r chrome ~/.mozilla/firefox/*.default-release/
cp prefs.js ~/.mozilla/firefox/*.default-release/
cp addons.json ~/.mozilla/firefox/*.default-release/


### INSTALLING AND CONFIGURING ADDONS
installffaddons(){
	addonlist="ublock-origin decentraleyes istilldontcareaboutcookies vimimium-c"
	addontmp="$(mktemp -d)"
	trap "rm -fr $addontmp" HUP INT QUIT TERM PWR EXIT
	IFS=' '
	sudo -u "$name" mkdir -p "$pdir/extensions/"
	for addon in $addonlist; do
		if [ "$addon" = "ublock-origin" ]; then
			addonurl="$(curl -sL https://api.github.com/repos/gorhill/uBlock/releases/latest | grep -E 'browser_download_url.*\.firefox\.xpi' | cut -d '"' -f 4)"
		else
			addonurl="$(curl --silent "https://addons.mozilla.org/en-US/firefox/addon/${addon}/" | grep -o 'https://addons.mozilla.org/firefox/downloads/file/[^"]*')"
		fi
		file="${addonurl##*/}"
		sudo -u "$name" curl -LOs "$addonurl" > "$addontmp/$file"
		id="$(unzip -p "$file" manifest.json | grep "\"id\"")"
		id="${id%\"*}"
		id="${id##*\"}"
		mv "$file" "$pdir/extensions/$id.xpi"
	done
	chown -R "$name:$name" "$pdir/extensions"
}
