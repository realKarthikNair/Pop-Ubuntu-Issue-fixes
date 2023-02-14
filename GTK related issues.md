##### **1. UI Elements look trash in MySQL Workbench while system-wide dark theme is enabled**

THIS IS MORE OF A MYSQL WORKBENCH ISSUE THAN AN UBUNTU/POP!_OS ISSUE

> Solution 1: Disable system-wide dark mode? (lol)

> Solution 2 (the real one): Disable dark theme only for Workbench

Run Workbench with "env GTK_THEME=Adwaita" prepended; ie `env GTK_THEME=Adwaita mysql-workbench %f`    

Change the desktop file (most probably /usr/share/applications/mysql-workbench.desktop) for a permanent change

Edited desktop file and more info [here](https://github.com/realKarthikNair/realKarthikNair/blob/main/Linux_fixes/mysql_workbench_dark_theme_buggy.md)

Credits : [here](https://askubuntu.com/a/1111198/1227056)

##### **2. LibreOffice UI elements look ancient**

    sudo apt install libreoffice-gtk3 libreoffice-gtk2
