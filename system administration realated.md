##### **1. `sudo: unable to resolve host $HOSTNAME`**

⚠ Read everything until the end including sidenote before doing anything ⚠

Fix:

Case 1: `sudo` works, though that error pops up

1. Edit `/etc/hostname`

        sudo gedit /etc/hostname
        
2. Add a new line that looks like

        127.0.0.1       localhost localhost.localdomain cosmic
        
    Where **REPLACE `cosmic` with your hostname**. If unsure, run `echo $HOSTNAME`
    Save the file

3. Reboot

Case 2: `sudo` doesn't work and that error pops up 

Do the same steps but you need to boot your device into recovery mode and use a cli text editor inside root shell to modify these files. Once done, reboot to your usual environment. 

Sidenote: The `/etc/hostname` (not /etc/hosts) file contains just the name of your machine. Incase it doesn't, make sure to edit it. The name of your machine/$HOSTNAME is what you see in the terminal along with your username, separated by `@` at prompt. i.e. `username@hostname`

Credit: [here](https://askubuntu.com/a/59517/1227056) and [here](https://askubuntu.com/a/119723/1227056)

