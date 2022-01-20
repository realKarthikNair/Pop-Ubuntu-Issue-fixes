#!/usr/bin/bash
sudo rmmod btusb
sleep 1
sudo modprobe btusb
sudo rmmod btusb|sleep 1|sudo modprobe btusb
