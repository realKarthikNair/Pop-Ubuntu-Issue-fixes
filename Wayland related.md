**1.Touchpad gestures (natural zooming, not the DPI thing) not working on browsers**

ONLY FOR WAYLAND USERS (if you're running the latest Ubuntu, you're prolly running wayland)

Run `echo $XDG_SESSION_TYPE` on your terminal to confirm if you're running wayland or X11.

> For Chrome/Chromium/based

Fix 1:

On chrome URL Bar, type

```
chrome://flags/#ozone-platform-hint
```

and hit "enter" key

Set it to Wayland and restart chrome

Fix 2 (Fix 1 would work mostly) :

    #run chrome this way, ONLY WORKS ON WAYLAND
    google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland
    
> For firefox

Run firefox like this 

```MOZ_ENABLE_WAYLAND=1 firefox```

For a permanent fix, edit the .desktop file of firefox. e.g., mine is at /usr/local/share/applications/firefox.desktop

Change the line starting with "Exec=" to this

        Exec=env MOZ_ENABLE_WAYLAND=1 MOZ_DBUS_REMOTE=1 GDK_BACKEND_WAYLAND=1 firefox %U


##### **2. Fix pipewire screen-sharing on Ubuntu/Pop!_OS 22.04**

Fix

    sudo apt install xdg-desktop-portal-gnome gnome-remote-desktop

    systemctl --user enable pipewire-media-session
    systemctl --user start pipewire-media-session
    systemctl --user restart xdg-desktop-portal-gnome

    reboot
    
credits: [here](https://askubuntu.com/a/1398720/1227056)

##### **3. Enable screen-sharing from Chrome on Wayland**

> Please refer 14th issue and solution too incase this alone doesnt work

Fix

On chrome URL Bar, type 

```
chrome://flags/#enable-webrtc-pipewire-capturer
```

Hit "enter" key

Set it to enable; restart Chrome.