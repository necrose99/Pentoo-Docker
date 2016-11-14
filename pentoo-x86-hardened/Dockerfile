FROM necrose99/gentoo-x86-hardened/

MAINTAINER necrose99 necrose99@protmail.ch mike@michaellawrenceit.com

ADD https://raw.githubusercontent.com/alexdux/async-emerge-overlay/master/async-emerge.conf /etc/portage/repos.conf/async-emerge.conf
ADD https://raw.githubusercontent.com/necrose99/Pentoo-Docker/master/build/pentoo.conf /etc/portage/repos.conf/pentoo.conf 

#Add portage 
wget http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2 /
mkdir -p /usr/portage/distfiles /usr/portage/metadata /usr/portage/packages 
bunzip2 -c  /portage-latest.tar.bz2 | tar -xf - -C /usr 
rm /portage-latest.tar.bz2 

#Add Layman
mkdir /etc/portage/package.accept_keywords 
mkdir -p /etc/portage/package.use 
# avoid a Python 2 dependency 
echo 'dev-vcs/git >> /etc/portage/package.use/layman 
echo 'app-portage/layman ~x86' >> /etc/portage/package.accept_keywords/layman 
echo 'dev-python/ssl-fetch ~x86' >> /etc/portage/package.accept_keywords/layman 

emerge --sync 
emerge -v git layman potage =dev-lang/python-2.7.10-r3  dev-lang/python sys-fs/squashfs-tools app-arch/p7zip
eselect news read new 
echo 'source /var/lib/layman/make.conf' >> /etc/portage/make.conf 
sed -i 's/^check_official.*/check_official : no/' /etc/layman/layman.cfg 
layman --fetch 
layman -L && Layman -a pentoo && layman -a sabayon && layman -a sabayon-distro

# This one should be present by running the build.sh script
RUN echo "Getting layman"
RUN emerge -v layman
RUN layman -S && layman -a pentoo
RUN eslect profile set pentoo:pentoo/hardened/linux/amd64/bleeding_edge
RUN pentoo-updater

