#Add sync portage
# kill add repo derpyness... 
RUN sed -i 's/^check_official.*/check_official : no/' /etc/layman/layman.cfg
RUN layman --fetch
### 
emerge-webrsync -q 
layman -S
# update pentoo.
eslect profile set pentoo:pentoo/default/linux/x86/bleeding_edge
pentoo-updater
echo "Bootstrapped  Pentoo iso into / upadted  & Happy Hacking...."
