🟪 unifox.js

1. A autobootstrap script that which installs the addons:
- ublock-origin
- decentraleyes
- istilldontcareaboutcookies
- vimimium-c
  
2. Then configures them with the included `addons.json` file

3. Then creates a folder called `chrome` with a wide variety of simplicty making css configurations within
- userChrome.css
- userContent.css
- userChome.js

4. At last copies my prefs.js `toolkit.legacyUserProfileCustomizations.stylesheets` which is necessary for the Files in Step 3. within the folder `chrome` to take effect and also because some extensions also store their settings out of addons.json within prefs.js. 

🟥 Configuration file that can overrides the Firefox settings to provide as much minimalism and enhanced security as possible.

🟩 Installaion:

`curl -s https://raw.githubusercontent.com/marlonivo/unifox.js/main/install.sh)`

🟦 License: MIT



