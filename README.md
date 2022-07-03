# Pop-Ubuntu-Issue-fixes

## Documenting how I got through some issues with Ubuntu and/or Pop with quotation to the sources (if available and necessary)

#### Please Note that the soluton(s) listed here are WHAT HELPED ME PERSONALLY solve the respective issues : THEY MAY NOT BE GENERIC and thus there is a good chance it MAY NOT work for you. However I have ensured that NONE OF THEM POSSIBLY BREAKS anyone's system. So they're completely safe to give a try.

**1. No "New Document" option in menu (when you right-click) of Gnome Files aka nautilus** <br>

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

~**2. Bluetooth not turning On**~ => No issues since updating to 22.04

Fix:

    sudo rmmod btusb
    sleep 1
    sudo modprobe btusb
    sudo rmmod btusb|sleep 1|sudo modprobe btusb
    

~**3. Bluetooth headphones/speakers not connecting or connecting but audio not routed through them**~ => Fixed since 22.04

Fix:

    #reboot is necessary
    sudo apt install libspa-0.2-bluetooth && sudo apt purge pulseaudio-module-bluetooth
    reboot


**4.Touchpad gestures (ZOOMING) not working on browsers**
ONLY FOR WAYLAND USERS (if you're running the latest Ubuntu, you're prolly running wayland)

> For Chrome/Chromium/based

Fix 1:

On chrome URL Bar, type ```chrome://flags``` 

![image](https://user-images.githubusercontent.com/78267371/162694799-33a26cd9-3cf5-4726-b963-3e8c4d06cb99.png)

Set it as shown (to Wayland) and restart chrome


Fix 2 (Fix 1 would work mostly) :

    #run chrome this way, ONLY WORKS ON WAYLAND
    google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland
    
> For firefox

Run firefox like this 

```MOZ_ENABLE_WAYLAND=1 firefox```

> For some reason, editing the Exec variable in firefox's desktop file doesnt do magic. So use the terminal to launch.
   
**5. Hardware Accelerated video decode on Chrome/chromium based browsers**
    
`This Worked for me!`
https://www.linuxuprising.com/2021/01/how-to-enable-hardware-accelerated.html

**6. Unable to extract tar.xz/xz files in nautilus/dolphin (literally no option)**

Fix:

    sudo apt-get install ark
    #close and reopen nautilus/dolphin

source : [here](https://askubuntu.com/a/881271/1227056)

**7. No python2 in system and `sudo apt install python` doesn't work**

Fix:

    sudo apt install python2
    
**8. Getting `E: Removing essential system-critical packages is not permitted. This might break the system` error while trying to remove a package**

Fix:

After reviewing carefully, you can pass `--allow-remove-essential` as an option to `apt-get` to bypass this warning

For example, `sudo apt-get purge gcc-11-base:i386* --allow-remove-essential`

credits: [here](https://www.reddit.com/r/debian/comments/r7cjow/comment/hmykar4/?utm_source=share&utm_medium=web2x&context=3)

**8. OpenCL not working and `clinfo` returns ZERO**

Fix

    sudo apt install mesa-opencl-icd
credits: [here](https://itectec.com/ubuntu/ubuntu-how-to-get-opencl-to-work-on-an-amd-gpu-with-ubuntu-16-04/#:~:text=When%20clinfo%20shows%20%22Number%20of,icd%22%20for%20a%20possible%20solution.)
    
**9. No fingerprint unlock option in settings**

Fix

    sudo apt install fprintd libpam-fprintd
    
**10. External links are opened as blank tabs in new browser window in Chrome**

Fix

    rm $HOME/.local/share/applications/google-chrome.desktop
credits: [here](https://askubuntu.com/a/689769/1227056)

**11. Fix OBS Studio virtual webcam not working**

Fix

Step 1:

Make Sure you have v4l2loopback installed. If unsure, run 

    sudo apt install v4l2loopback*
    reboot
    
Step 2:

Open OBS Studio, and run this twice (for some reason running it once doesn't solve the issue atleast for me)

    sudo rmmod v4l2loopback
    sudo modprobe v4l2loopback exclusive_caps=1
    
**12. Enable screen-sharing from Chrome on Wayland**

> Please refer 13th issue and soln too incase this alone doesnt work

Fix

On chrome URL Bar, type ```chrome://flags``` 

![image](https://user-images.githubusercontent.com/78267371/162693891-f0248d2b-1d25-4079-a0ce-b0e82156fbbd.png)

Enable this flag and restart Chrome.

**13. Fix pipewire screen-sharing on Ubuntu/Pop!_OS 22.04**

Fix

    sudo apt install xdg-desktop-portal-gnome gnome-remote-desktop

    systemctl --user enable pipewire-media-session
    systemctl --user start pipewire-media-session
    systemctl --user restart xdg-desktop-portal-gnome

    reboot
    
credits: [here](https://askubuntu.com/a/1398720/1227056)

~**14. OBS Studio saving blank video files of screen recording on wayland even when pipewire screensharing is working in OBS preview**~
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

**15. UI Elements look trash in MySQL Workbench while system-wide dark theme is enabled**

THIS IS MORE OF A MYSQL WORKBENCH ISSUE THAN AN UBUNTU/POP!_OS ISSUE

> Solution 1: Disable system-wide dark mode? (lol)

> Solution 2 (the real one): Disable dark theme only for Workbench

Run Workbench with "env GTK_THEME=Adwaita" prepended; ie `env GTK_THEME=Adwaita mysql-workbench %f`    

~Change the file (most probably /usr/share/applications/mysql-workbench.desktop) for a permanent change~
(Editing the desktop file makes the workbench disappear from the launcher after a while for an unknown reason, atleast on my machine)

Credits : [here](https://askubuntu.com/a/1111198/1227056)
    
**16. MySQL Workbench as a snap can't connect to MySQL server at localhost**

    sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service
    
Credits: [here](https://askubuntu.com/a/1242777/1227056)

**17. LibreOffice UI looks ugly**

    sudo apt install libreoffice-gtk3 libreoffice-gtk2

**18. Set keybinding for 'Show Desktop'**

e.g. to set 'Super/windows key'+'D' to show desktop 

    dconf write /org/gnome/desktop/wm/keybindings/show-desktop "['<Super>d']"
    
Credits : [here](https://www.reddit.com/r/pop_os/comments/gm3kfa/comment/ftq6kfz/?utm_source=share&utm_medium=web2x&context=3)

**19. Weird window open named with characters that looks like e.g. @!0;BDHF**

Fix: Disable any desktop icons extension(s) you're using eg [this](https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/)
*Unfortunately I dont see any solution to get rid off that without sacrificing desktop icons*
