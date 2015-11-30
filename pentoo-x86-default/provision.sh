# This provisions iso's into Docker containers.

mkdir newWorldOrder; cd newWorldOrder ; mkdir /newWorldOrder/pentoo_tmp; cd  /newWorldOrder/pentoo_tmp
wget -bqc http://www.pentoo.ch/isos/latest-iso-symlinks/pentoo-x86-default.iso
7z x *.iso
echo "pentoo-x86-default.iso unpacking"
rm *.iso
echo "unpacking Squashfile and modules"
unsquashfs -f -d /newWorldOrder/  /newWorldOrder/pentoo_tmp/modules/image.squashfs
unsquashfs -f -d /newWorldOrder/ /newWorldOrder/pentoo_tmp/modules/*.lzm* 
rm -rf /newWorldOrder/pentoo_tmp/

#Busy Box
wget -q -O /busybox "http://www.busybox.net/downloads/binaries/latest/busybox-${busybox_version}"
chmod +x /busybox
/busybox rm -rf /lib* /usr /var /bin /sbin /opt /mnt /media /root /home /run /tmp
/busybox cp -fRap lib* /
/busybox cp -fRap bin boot home media mnt opt root run sbin tmp usr var /
/busybox cp -fRap etc/* /etc/
cd /
#commit suicide 
/busybox rm -rf newWorldOrder /busybox /provision.sh /linuxrc 
#Add sync portage
emerge-webrsync -q 
layman -S
# update pentoo.
eslect profile set pentoo:pentoo/default/linux/x86/bleeding_edge
pentoo-updater
echo "Bootstrapped  Pentoo iso into /  & Happy Hacking...."
