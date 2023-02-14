##### **1. OpenCL not working and `clinfo` returns ZERO**

Fix

    sudo apt install mesa-opencl-icd
credits: [here](https://itectec.com/ubuntu/ubuntu-how-to-get-opencl-to-work-on-an-amd-gpu-with-ubuntu-16-04/#:~:text=When%20clinfo%20shows%20%22Number%20of,icd%22%20for%20a%20possible%20solution.)


##### ~**2. Hardware Accelerated video decode on Chrome/chromium based browsers**~
It's working out of the box on modern versions of Chrome, confirm by running ```chrome://gpu``` and check if the output of `Video Decode` is `Hardware accelerated`

Fix: 

`This Worked for me!`
https://www.linuxuprising.com/2021/01/how-to-enable-hardware-accelerated.html

