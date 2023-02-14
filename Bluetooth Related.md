##### ~**1. Bluetooth not turning On**~ => No issues since updating to 22.04

Fix:

    sudo rmmod btusb
    sleep 1
    sudo modprobe btusb
    sudo rmmod btusb|sleep 1|sudo modprobe btusb
    

##### ~**2. Bluetooth headphones/speakers not connecting or connecting but audio not routed through them**~ => Fixed since 22.04

Fix:

    #reboot is necessary
    sudo apt install libspa-0.2-bluetooth && sudo apt purge pulseaudio-module-bluetooth
    reboot

