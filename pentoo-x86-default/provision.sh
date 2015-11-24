# This one should be present by ning the build.sh script
echo "Getting power ISO to Unpack Pentoo into the Gentoo root & Overlay"
wget -O poweriso-1.3.tar.gz http://goo.gl/p8Tzc
tar -xzvf poweriso-1.3.tar.gz -C /usr/local/bin
chmod +x /usr/local/bin/poweriso
mkdir /pentoo_tmp
cd  /pentoo_tmp
wget -bqc http://www.pentoo.ch/isos/latest-iso-symlinks/pentoo-x86-default.iso
echo "pentoo-amd64-default.iso unpacking"
./poweriso extract pentoo-amd64-default.iso / -od /pentoo_tmp
emerge -v sys-fs/squashfs-tools
echo "unpacking Squashfile and modules"
unsquashfs -f -d / /pentoo_tmp/modules/image.squashfs
unsquashfs -f -d / /pentoo_tmp/modules/*.lzm* 
rm -rf /pentoo_tmp/
eslect profile set pentoo:pentoo/hardened/linux/x86/bleeding_edge
pentoo-updater
echo "Bootstrapped  Pentoo iso into /:"