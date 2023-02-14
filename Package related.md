##### **1. No python2 in system and `sudo apt install python` doesn't work**

Python2 package is now `python2` and not `python` from Ubuntu 20.04 onwards.

Fix:

    sudo apt install python2


##### **2. OpenCL not working and `clinfo` returns ZERO**

Fix

    sudo apt install mesa-opencl-icd
credits: [here](https://itectec.com/ubuntu/ubuntu-how-to-get-opencl-to-work-on-an-amd-gpu-with-ubuntu-16-04/#:~:text=When%20clinfo%20shows%20%22Number%20of,icd%22%20for%20a%20possible%20solution.)


##### **3. Getting `E: Removing essential system-critical packages is not permitted. This might break the system` error while trying to remove a package**

Fix:

After reviewing carefully, you can pass `--allow-remove-essential` as an option to `apt-get` to bypass this warning

For example, `sudo apt-get purge gcc-11-base:i386* --allow-remove-essential`

credits: [here](https://www.reddit.com/r/debian/comments/r7cjow/comment/hmykar4/?utm_source=share&utm_medium=web2x&context=3)