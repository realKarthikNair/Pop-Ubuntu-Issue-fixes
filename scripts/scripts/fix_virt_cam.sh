!#/usr/bin/bash
sudo rmmod v4l2loopback
sudo modprobe v4l2loopback exclusive_caps=1
sudo rmmod v4l2loopback
sudo modprobe v4l2loopback exclusive_caps=1
