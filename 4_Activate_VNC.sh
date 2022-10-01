#!/bin/bash
#

sudo apt -y update
sudo apt -y install xfce4 xfce4-goodies
sudo apt -y install tightvncserver
vncserver
vncserver -kill :1
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
touch ~/.vnc/xstartup
echo '#!/bin/bash' > ~/.vnc/xstartup
echo 'xrdb $HOME/.Xresources' >> ~/.vnc/xstartup
echo 'startxfce4 &' >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup
vncserver

# Clean packagers
sudo apt-get -y clean
