### 🟪 What is unifox.js ?
Unifox.js is autobootstrap-script that configures a keyboard based, unified and distraction-free Firefox-UI plus Webpagedesign with the help of the `toolkit.legacyUserProfileCustomizations.stylesheets` function, as well as security and anti-tracking features with the help of [arkenfox](https://github.com/arkenfox/user.js/).

![2024-08-09-045130_1920x1080_scrot](https://github.com/user-attachments/assets/8d693063-5032-4c87-9d56-3c2335ff158b)

### 🟨 The Autobootstrap Script will do the following with your boring firefox:

1. Creates a new profile called `unifox`, which in itself creates a new directory in your `.mozilla` configuration folder

2. Inside your new profile directory, it will install the addon's:
- [ublock-origin](https://ublockorigin.com/) [preconfigured]
- [stlyus](https://github.com/openstyles/stylus) [preconfigured]
- [vimimium-c](https://github.com/gdh1995/vimium-c) [preconfigured]
  
3. Then configures the labelled Add-On's, with the files from the `extensions` folder.

4. Activate'S `toolkit.legacyUserProfileCustomizations.stylesheets` which is necessary for the Files within the folder `chrome` to take effect. Then copie's the .css configuration files into which include:
- userChrome.css
- userContent.css
- userChrome.js

5. Set a custom about:home which can be changed within the `.mozilla/firefox/xxxxx.default-release/chrome/img/` directory.

6. At last copies my `user.js` and extension-settings.json.
   
### 🟩 Installaion:
```
git clone https://github.com/marlonivo/unifox.git && cd unifox && chmod +x unifox.sh && ./unifox
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
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt y` - https://youtube.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt h` - vimium://options<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt e` - https://deepl.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt g` - https://github.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt k` - https://chatgpt.com<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt c` - stylus toolbar<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt u` - ublock origin toolbar<br>
&nbsp;&nbsp;&nbsp;&nbsp;`strg alt p` - ublock element picker<br>
`alt left` - go one step back in history<br>
`alt right` - go one step forth in history<br>
`strg shift s` - make a screenshot<br>
`strg shift h` - search history, downloads, tags and bookmarks<br>
`strg shift k` - developer console<br>
`strg shift a` - about:addons<br>

**youtube:**<br>
`t` - cinema mode<br>
`s` - fullscreen<br>
`c` - subtitles<br>
`strg alt i` - zoom in-to video<br>
`strg alt o` - zoom out-of video

### 🟦 License: MIT



