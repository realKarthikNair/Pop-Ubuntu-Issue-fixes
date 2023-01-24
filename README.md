# Pop-Ubuntu-Issue-fixes

## Documenting how I got through some issues with Ubuntu and/or Pop with quotation to the sources (if available and necessary)

#### Please Note that the soluton(s) listed here are WHAT HELPED ME PERSONALLY solve the respective issues : THEY MAY NOT BE GENERIC and thus there is a good chance it MAY NOT work for you. However I have ensured that NONE OF THEM POSSIBLY BREAKS anyone's system. So they're completely safe to give a try.

##### **1. No "New Document" option in menu (when you right-click) of Gnome Files aka nautilus** <br>

Fix:

    #Fire up the terminal
    cd ~/Templates
    touch TextFile.txt
    touch WordFile.docx
    touch OpenOfficeText.odt
    touch ExcelFile.xlsx
    touch shellscript.sh
    touch htmlfile.html
    
credits : [here](https://askubuntu.com/a/209669/1227056)

##### ~**2. Bluetooth not turning On**~ => No issues since updating to 22.04

Fix:

    sudo rmmod btusb
    sleep 1
    sudo modprobe btusb
    sudo rmmod btusb|sleep 1|sudo modprobe btusb
    

##### ~**3. Bluetooth headphones/speakers not connecting or connecting but audio not routed through them**~ => Fixed since 22.04

Fix:

    #reboot is necessary
    sudo apt install libspa-0.2-bluetooth && sudo apt purge pulseaudio-module-bluetooth
    reboot


**4.Touchpad gestures (natural zooming, not the DPI thing) not working on browsers**
ONLY FOR WAYLAND USERS (if you're running the latest Ubuntu, you're prolly running wayland)

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
   
##### ~**5. Hardware Accelerated video decode on Chrome/chromium based browsers**~
It's working out of the box on modern versions of Chrome, confirm by running ```chrome://gpu``` and check if the output of `Video Decode` is `Hardware accelerated`

Fix: 

`This Worked for me!`
https://www.linuxuprising.com/2021/01/how-to-enable-hardware-accelerated.html

##### **6. Unable to extract tar.xz/xz files in nautilus/dolphin (literally no option)**

Fix:

    sudo apt-get install ark
    #close and reopen nautilus/dolphin

source : [here](https://askubuntu.com/a/881271/1227056)

##### **7. No python2 in system and `sudo apt install python` doesn't work**

Fix:

    sudo apt install python2
    
##### **8. Getting `E: Removing essential system-critical packages is not permitted. This might break the system` error while trying to remove a package**

Fix:

After reviewing carefully, you can pass `--allow-remove-essential` as an option to `apt-get` to bypass this warning

For example, `sudo apt-get purge gcc-11-base:i386* --allow-remove-essential`

credits: [here](https://www.reddit.com/r/debian/comments/r7cjow/comment/hmykar4/?utm_source=share&utm_medium=web2x&context=3)

##### **9. OpenCL not working and `clinfo` returns ZERO**

Fix

    sudo apt install mesa-opencl-icd
credits: [here](https://itectec.com/ubuntu/ubuntu-how-to-get-opencl-to-work-on-an-amd-gpu-with-ubuntu-16-04/#:~:text=When%20clinfo%20shows%20%22Number%20of,icd%22%20for%20a%20possible%20solution.)
    
##### **10. No fingerprint unlock option in settings**

Fix

    sudo apt install fprintd libpam-fprintd
    
##### **11. External links are opened as blank tabs in new browser window in Chrome**

Fix

    rm $HOME/.local/share/applications/google-chrome.desktop
credits: [here](https://askubuntu.com/a/689769/1227056)

##### **12. Fix OBS Studio virtual webcam not working**

Fix

Step 1:

Make Sure you have v4l2loopback installed. If unsure, run 

    sudo apt install v4l2loopback*
    reboot
    
Step 2:

Open OBS Studio, and run this twice (for some reason running it once doesn't solve the issue atleast for me)

    sudo rmmod v4l2loopback
    sudo modprobe v4l2loopback exclusive_caps=1
    
##### **13. Enable screen-sharing from Chrome on Wayland**

> Please refer 14th issue and solution too incase this alone doesnt work

Fix

On chrome URL Bar, type 

```
chrome://flags/#enable-webrtc-pipewire-capturer
```

Hit "enter" key

Set it to enable; restart Chrome.

##### **14. Fix pipewire screen-sharing on Ubuntu/Pop!_OS 22.04**

Fix

    sudo apt install xdg-desktop-portal-gnome gnome-remote-desktop

    systemctl --user enable pipewire-media-session
    systemctl --user start pipewire-media-session
    systemctl --user restart xdg-desktop-portal-gnome

    reboot
    
credits: [here](https://askubuntu.com/a/1398720/1227056)

##### ~**15. OBS Studio saving blank video files of screen recording on wayland even when pipewire screensharing is working in OBS preview**~
Fixed Now (if still doesn't work, try a reinstall of obs-studio after adding the latest ppa)

Fix

For Pop!_OS users

    Remove the apt version and get the flatpak version from Pop Shop

For Ubuntu users

1. Get the snap version from store. 

But if it still doesn't work or the snap version feels slow,

    sudo apt install flatpak
    sudo apt install gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub com.obsproject.Studio

##### **16. UI Elements look trash in MySQL Workbench while system-wide dark theme is enabled**

THIS IS MORE OF A MYSQL WORKBENCH ISSUE THAN AN UBUNTU/POP!_OS ISSUE

> Solution 1: Disable system-wide dark mode? (lol)

> Solution 2 (the real one): Disable dark theme only for Workbench

Run Workbench with "env GTK_THEME=Adwaita" prepended; ie `env GTK_THEME=Adwaita mysql-workbench %f`    

Change the desktop file (most probably /usr/share/applications/mysql-workbench.desktop) for a permanent change

Edited desktop file and more info [here](https://github.com/realKarthikNair/realKarthikNair/blob/main/Linux_fixes/mysql_workbench_dark_theme_buggy.md)

Credits : [here](https://askubuntu.com/a/1111198/1227056)
    
##### **17. MySQL Workbench as a snap can't connect to MySQL server at localhost**

    sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service
    
Credits: [here](https://askubuntu.com/a/1242777/1227056)

##### **18. LibreOffice UI looks elements looks ancient**

    sudo apt install libreoffice-gtk3 libreoffice-gtk2

##### **19. Set keybinding for 'Show Desktop'**

e.g. to set 'Super/windows key'+'D' to show desktop 

    dconf write /org/gnome/desktop/wm/keybindings/show-desktop "['<Super>d']"
    
Credits : [here](https://www.reddit.com/r/pop_os/comments/gm3kfa/comment/ftq6kfz/?utm_source=share&utm_medium=web2x&context=3)

##### **20. Weird window open named with characters that looks like e.g. @!0;BDHF**

Fix: Disable any desktop icons extension(s) you're using eg [this](https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/)
*Unfortunately I dont see any solution to get rid off that without sacrificing desktop icons*

##### **21. Bash looking at wrong path for vim**

Fix:

    hash -d vim
    
##### **22 Password asked over and over again to access/modify/files in certain disks/disk partitions**

Fix:

> Warning: Please be aware of what you are doing

Reason: For some unknown reason, `systemd-coredump` is owning those partitions/disks and changing the ownership to the current user would fix the issue

        Fix:

        1. Launch Nautilus as root `sudo nautilus` (its generally not recommended to launch nautilus as root but lets do this time to make the process a bit simpler)
        2. Click on "Other Locations" on the sidebar
        3. Head over to "computer" > media > $USER and locate the partition there. (where $USER is your username)
        4. On the right click menu, select "Properties"
        5. On Properties' top bar, click on "Permissions"
        6. Change the "Owner" and "Acess" to your username from the choices
        7. Change the "Access" to "Create and Delete files" in all three options
        8. Click on "Change Permissions for Enclosed Files" and edit the owner's permissions to "Read and Write" and "Create and Delete files" for folders and files respectively

        This is a dirty fix to the issue 
        
Credits: Me

##### **23 Spotify Linux client can't open playlist links**

There is no fix, the only workaround is to open the playlist in web player/ smartphone and like it/ add to library. That way it becomes visible on the side panel on Linux Client and easily accessible 
