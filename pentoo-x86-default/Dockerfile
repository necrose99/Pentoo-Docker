FROM scratch
MAINTAINER necrose99 necrose99@protmail.ch mike@michaellawrenceit.com
# This one should be present by running the build.sh script
ADD http://downloads.sourceforge.net/project/pentoo-docker-tarballs/Pentoo_x86_default/Pentoo_Linux_x86_Default_2015.0_RC4.6.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentoo-docker-tarballs%2Ffiles%2FPentoo_x86_default%2F&ts=1449639384&use_mirror=skylineservers /
ADD provision.sh /
RUN /provision.sh
# Setup the (virtually) current runlevel
RUN echo "default" > /run/openrc/softlevel

# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /etc/rc.conf

# Setup the net.lo runlevel
RUN ln -s /etc/init.d/net.lo /run/openrc/started/net.lo

# Setup the net.eth0 runlevel
RUN ln -s /etc/init.d/net.lo /etc/init.d/net.eth0
RUN ln -s /etc/init.d/net.eth0 /run/openrc/started/net.eth0

# By default, UTC system
RUN echo 'UTC' > /etc/timezone
# add volume to keep build packages 
VOLUME /usr/portage:rw", /usr/portage/distfiles:rw, /usr/portage/distfiles:rw
VOLUME  /var/lib/layman:rw"
