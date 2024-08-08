🟪 What is unifox.js
A 


1. A autobootstrap script that which installs the addons:
- [ublock-origin](https://ublockorigin.com/)
- [decentraleyes](https://decentraleyes.org/)
- [istilldontcareaboutcookies](https://www.stilldontcareaboutcookies.com/)
- [vimimium-c](https://github.com/gdh1995/vimium-c)
  
2. Then configures them with the included `addons.json` file

3. Then creates a folder called `chrome` with a wide variety of simplicty making css configurations within
- userChrome.css
- userContent.css
- userChome.js

4. At last copies my prefs.js `toolkit.legacyUserProfileCustomizations.stylesheets` which is necessary for the Files in Step 3. within the folder `chrome` to take effect and also because some extensions also store their settings out of addons.json within prefs.js. 

🟥 Configuration file that can overrides the Firefox settings to provide as much minimalism and enhanced security as possible.

🟩 Installaion:
```
git clone https://raw.githubusercontent.com/marlonivo/unifox.js
cd unifox.js
install.sh
```
🟦 License: MIT



