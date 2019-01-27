# pycharm-wallaby-tools
External tools for Windows and Linux to send Python code to the KIPR Wallaby platform using the PyCharm IDE

# Installation instructions
1. Download and install PyCharm (we use Community Edition (CE), which is free)
2. Clone or download this repository. Unzip if necessary.
3. Move the Windows or Linux folders somewhere memorable, perhaps C:\Users\<Username>\Windows or /home/<Username>/Linux
4. Configure a new External Tool for PyCharm
  - Navigate to File>Settings>Tools>External Tools
  - Click the Plus + icon to add a new tool
  - Configure this external tool with the values shown in the image (Note that your IP address will differ depending on whether you are connecting via cable, over the Wallaby hotspot, or if you have reconfigured your Wallaby to connect over the Wifi as we have done. This IP address should be the IP you normally use to connect to your Wallaby: 
![PyCharm External Tool Config](https://github.com/deadrobots/pycharm-wallaby-tools/blob/master/PyCharmExternalToolConfig.jpg "PyCharm External Tool Config")
5. Now to upload code, go into PyCharm and click: Tools>External Tools>USBWallabyTransfer 
  
# Optional PyCharm config for syntax highlighting
Much of the Python code that works with the Wallaby platform uses the wallaby.py library, which PyCharm doesn't know about. This results in squiggly red underlines in your IDE. It will, however, work fine when run on your Wallaby. To fix this, you must tell your computer's Python interpreter about wallaby.py. One way to do this is to drag wallaby.py (included in this repo) into your project in PyCharm. This is kinda messy, though. I would suggest adding it into the Python2 or Python3 lib directories instead (you only need to add it to the lib directory of the interpreter that your PyCharm is set up to use, whether 2 or 3... 
- /usr/lib/python2.7/
- /usr/lib/python3/
- C:\Users\<Username>\AppData\Local\Programs\Python\Python36...\lib\
