You **don't** need hidpi-daemon and the battery usage incurred by it if 

- Your machine only has a 1080p display and you don't use an external monitor
- Your machine has a 1080p+ HiDPI display but 
    - You use Wayland display compositor instead of the X.org display server
    - You prefer more battery life in exchange of not having the crispiest possible display rendering on your screen
    - You prefer LoDPI

You, thus can safely remove it 

```bash
sudo apt purge hidpi-daemon 
```
