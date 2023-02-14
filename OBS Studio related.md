##### **1. Fix OBS Studio virtual webcam not working**

Fix

Step 1:

Make Sure you have v4l2loopback installed. If unsure, run 

    sudo apt install v4l2loopback*
    reboot
    
Step 2:

Open OBS Studio, and run this twice (for some reason running it once doesn't solve the issue atleast for me)

    sudo rmmod v4l2loopback
    sudo modprobe v4l2loopback exclusive_caps=1

##### **2. Fix OBS Studio screenrecording/screensharing not working on wayland**

Fix

    sudo apt install xdg-desktop-portal-gnome gnome-remote-desktop

    systemctl --user enable pipewire-media-session
    systemctl --user start pipewire-media-session
    systemctl --user restart xdg-desktop-portal-gnome

    reboot

If it doesn't work, try re-installing OBS Studio after adding the latest ppa since OBS officially supports pipewire screenrecording now.


##### ~**3. OBS Studio saving blank video files of screen recording on wayland even when pipewire screensharing is working in OBS preview**~
Fixed Now in official deb packages itself (if still doesn't work, try a reinstall of obs-studio after adding the latest ppa)

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