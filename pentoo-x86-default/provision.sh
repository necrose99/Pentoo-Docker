#Add sync portage
emerge-webrsync -q 
layman -S
# update pentoo.
eslect profile set pentoo:pentoo/default/linux/x86/bleeding_edge
pentoo-updater
echo "Bootstrapped  Pentoo iso into / upadted  & Happy Hacking...."
