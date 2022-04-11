#!/usr/bin/bash

sudo apt install xdg-desktop-portal-gnome gnome-remote-desktop

systemctl --user enable pipewire-media-session
systemctl --user start pipewire-media-session
systemctl --user restart xdg-desktop-portal-gnome

reboot
