### 🟪 What is unifox.js ?
Unifox.js is autobootstrap-script that configures a unified-and distraction-free Browser-UI & Webpagedesign, as well as security and anti-tracking features from with the help of [arkenfox](https://github.com/arkenfox/user.js/) and addon's like [decentraleyes](https://decentraleyes.org/).

### 🟨 The Autobootstrap Script will do the following with your boring firefox:

1. Inside your .mozilla directory, it will install the addon's:
- [ublock-origin](https://ublockorigin.com/) [preconfigured]
- [decentraleyes](https://decentraleyes.org/) 
- [istilldontcareaboutcookies](https://www.stilldontcareaboutcookies.com/)
- [vimimium-c](https://github.com/gdh1995/vimium-c) [preconfigured]
  
2. Then configures the labelled Add-On's, with the included `addons.json` file.

3. Create a folder in the called `chrome` with a wide variety of simplicty making .css configuration files which include:
- userChrome.css
- userContent.css
- userChrome.js

4. Set a custom background which can be changed within the `.mozilla/firefox/xxxxx.default-release/chrome/img/` directory.

5. At last copies my `prefs.js` to activate `toolkit.legacyUserProfileCustomizations.stylesheets` which is necessary for the Files within the folder `chrome` to take effect and also because some extensions store their settings in there.
   
### 🟩 Installaion:
```
git clone https://raw.githubusercontent.com/marlonivo/unifox.js
cd unifox.js
install.sh
```

### 🟦 Unified Keybindings for page-navigation and browser-tab-operations:

**page navigation:**<br>
`?` - show help (overview of all keybindings)<br>
`f` - show quick keybinding's<br>
`j` - scroll down<br>
`k` - scroll up<br>
`/` - enter find mode<br>
&nbsp;&nbsp;&nbsp;&nbsp;`n` - cycle through 'find mode'<br>
`r` - reload tab<br>
`x` - close tab<br>
**will come in future:**<br>
`t` - translate webpage<br>
`d` - de-/activate dark mode<br>
`s` - screenshot

**browser tab operations:**<br>
`strg tab` - cycle through open Tabs<br>
`strg t` - new tab<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg y` - https://youtube.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg h` - vimium://options<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg e` - https://deepl.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg g` - https://github.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg k` - https://chatgpt.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt a` - about:addons<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt c` - stylus toolbar<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt u` - ublock origin toolbar<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt p` - ublock element picker<br>
`alt left` - go one step back in history<br>
`alt right` - go one step forth in history<br>
`strg shift s` - make a screenshot<br>
`strg shift h` - search history, downloads, tags and bookmarks<br>
`strg shift k` - developer console

**youtube:**<br>
`t` - cinema mode<br>
`s` - fullscreen<br>
`c` - subtitles<br>
`strg alt i` - zoom in-to video<br>
`strg alt o` - zoom out-of video

### 🟦 License: MIT



