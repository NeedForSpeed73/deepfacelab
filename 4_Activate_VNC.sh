#!/bin/bash
#
printf %"s\n" "" "* Installing XFCE4 and tightvncserver packages" ""
sudo apt -y update
sudo apt -y install xfce4 xfce4-goodies
sudo apt -y install tightvncserver

printf %"s\n" "" "* Generating and backing up .vcn config files" ""
vncserver
vncserver -kill :1
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak

printf %"s\n" "" "* Creating .vcn/xstartup script" ""
touch ~/.vnc/xstartup
printf %"s\n" '#!/bin/bash' > ~/.vnc/xstartup
printf %"s\n" 'xrdb $HOME/.Xresources' >> ~/.vnc/xstartup
printf %"s\n" 'startxfce4 &' >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

printf %"s\n" "" "* Launching VCN server" ""
vncserver

printf %"s\n" "" "* Cleaning Up" ""
# Clean packagers
sudo apt-get -y clean
