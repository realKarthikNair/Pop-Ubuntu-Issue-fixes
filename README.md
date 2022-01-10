# Pop-Ubuntu-Bug-fixes

Documenting how i got through some stupid issues with Ubuntu and/or Pop with quotation to the sources (if I remember/bookmarked) that helped me.

**1. No "New Document" option in menu (when you right-click) of Gnome Files aka nautilus** <br>

Fix:

    #Fire up the terminal
    cd ~/Templates
    touch new
    
source : [here](https://askubuntu.com/a/209669/1227056)

**2. Bluetooth not turning On**

Fix:

    sudo rmmod btusb
    sleep 1
    sudo modprobe btusb
    sudo rmmod btusb|sleep 1|sudo modprobe btusb
    

**3. Bluetooth headphones/speakers not connecting or connecting but audio not routed through them**

Fix:

    #reboot is necessary
    apt install libspa-0.2-bluetooth && apt purge pulseaudio-module-bluetooth
    reboot


**4. Chrome touchpad page zooming features (only on wayland) like on Windows without using stuff like fusuma (fusuma anyway was only doing the Ctrl + or - page dpi zoom, which was different**

Fix:

    #run chrome this way, ONLY WORKS ON WAYLAND
    google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland
    
Alternative suggestion:

    Switch to Firefox! It has that feature out of box in wayland... 
    I can't cuz my word depends on MS Teams that doesnt work on Firefox and I'm not a fan of keeping multiple browsers or worse, the stupid Linux native version of MS Teams (as of Dec 2021)


**5. Hardware Accelerated video decode on Chrome/chromium based browsers**
    
`This Worked for me!
https://www.linuxuprising.com/2021/01/how-to-enable-hardware-accelerated.html`

**6. Unable to extract xz files in nautilus/dolphin (literally no option)**

    sudo apt-get install ark
    #close and reopen nautilus/dolphin

source : [here](https://askubuntu.com/a/881271/1227056)
