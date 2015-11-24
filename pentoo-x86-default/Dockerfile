FROM necrose99/gentoo-docker-x86

MAINTAINER necrose99 necrose99@protmail.ch mike@michaellawrenceit.com

# This one should be present by running the build.sh script
RUN mkdir -p /usr/portage/distfiles /usr/portage/metadata /usr/portage/packages
ADD provision.sh /
RUN /provision.sh
VOLUME /usr/portage