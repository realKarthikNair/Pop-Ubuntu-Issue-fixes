#!/usr/bin/bash
sudo apt install libspa-0.2-bluetooth && sudo apt purge pulseaudio-module-bluetooth
echo
echo "reboot is necessary"
echo
echo "Do you want to reboot now? [y,n]"
read input
if [[ "$input" == "y" ]] || [[ "$input" == "yes" ]] || [[ "$input" == "Y" ]]; then
   reboot
else
   echo "Abort."
fi
