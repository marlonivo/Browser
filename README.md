🟪 What is unifox.js ?
Unifox.js is autobootstrap-script that configures a unified-and distraction-free Browser-UI/Webpagedesign, as well as security and anti-tracking features from with the help of [arkenfox](https://github.com/arkenfox/user.js/) and addon's like [decentraleyes](https://decentraleyes.org/).

🟨 The Autobootstrap Script will do the following with your boring firefox:

1. Install the addon's:
- [ublock-origin](https://ublockorigin.com/)
- [decentraleyes](https://decentraleyes.org/)
- [istilldontcareaboutcookies](https://www.stilldontcareaboutcookies.com/)
- [vimimium-c](https://github.com/gdh1995/vimium-c)
  
2. Then configures them, with the included `addons.json` file.

3. Create a folder called `chrome` with a wide variety of simplicty making .css configuration files which include:
- userChrome.css
- userContent.css
- userChrome.js

4. Set a custom background which can be changed within the `/home/artix/Code/Github/unifox/chrome/img/` directory.

5. At last copies my `prefs.js` to activate `toolkit.legacyUserProfileCustomizations.stylesheets` which is necessary for the Files within the folder `chrome` to take effect and also because some extensions store their settings in there.
   
🟩 Installaion:
```
git clone https://raw.githubusercontent.com/marlonivo/unifox.js
cd unifox.js
install.sh
```
🟦 License: MIT



