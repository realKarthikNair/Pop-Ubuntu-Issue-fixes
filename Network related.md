##### **1 DNS issue due to messed up VPN configs. No internet. DNS_PROBE_FINISHED_BAD_CONFIG**

Fix: 

1. Edit `/etc/systemd/resolved.conf`

        sudo gedit /etc/systemd/resolved.conf
    
2. Add DNS entries and save the file

        [Resolve]
        DNS=8.8.8.8 8.8.4.4 1.1.1.1
    
3. restart systemd-resolved

        sudo service systemd-resolved restart

4. Delete the symlink to /etc/resolv.conf

        sudo rm /etc/resolv.conf
    
5. Create a new symlink

        sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
    
6. Restart systemd-resolved

        sudo service systemd-resolved restart

Credit: [here](https://tjisblogging.blogspot.com/2022/04/ubuntu-dns-issue-fix.html)


##### **2. Wi-Fi doesn't work on Linux in dual boot with Windows**

Fix:

Turn off the "Fast Startup" option in Windows.

To turn off Fast Startup, follow these steps:

1. Open the Control Panel (icons view), and click/tap on the Power Options icon.
2. Click/tap on Choose what the power buttons do on the left side.
3. Click/tap on Change settings that are currently unavailable on the right side.
4. Uncheck Turn on fast startup (recommended) under Shutdown settings, and click/tap on Save changes.

