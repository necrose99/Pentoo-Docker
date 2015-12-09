FROM scratch
MAINTAINER necrose99 necrose99@protmail.ch mike@michaellawrenceit.com
# This one should be present by running the build.sh script
ADD http://downloads.sourceforge.net/project/pentoo-docker-tarballs/Pentoo_x86_default/Pentoo_Linux_x86_Default_2015.0_RC4.6.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentoo-docker-tarballs%2Ffiles%2FPentoo_x86_default%2F&ts=1449639384&use_mirror=skylineservers /
ADD provision.sh /
RUN /provision.sh

VOLUME /usr/portage
VOLUME /var/lib/layman
CMD /bin/bash
