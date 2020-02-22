ARG BOOTSTRAP
FROM ${BOOTSTRAP:necrose99/custom-alpine-builder:latest} as builder
###  pentoo Varriant 
### FROM alpine:3.7 as builder
ARCH=amd64
#ARG BOOTSTRAP
#FROM ${BOOTSTRAP:-alpine:latest} as builder
#RUN apk add squashfs-tools 	p7zip

WORKDIR /gentoo

MAINTAINER necrose99 necrose99@protmail.ch mike@michaellawrenceit.com

ADD https://raw.githubusercontent.com/alexdux/async-emerge-overlay/master/async-emerge.conf /gentoo/etc/portage/repos.conf/async-emerge.conf
# async-emerge useful for flying chroot rebuilds etc. 
ADD https://raw.githubusercontent.com/necrose99/Pentoo-Docker/master/build/pentoo.conf /gentoo/etc/portage/repos.conf/pentoo.conf 
#Add portage 
ADD wget http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2 /gentoo
RUN mkdir   /gentoo/packages && mkdir -p {/gentoo/var/gentoo/distfiles, /gentoo/var/db/repos/gentoo} 

#Add Layman / portage stuffs. 
mkdir /gentoo/etc/portage/package.accept_keywords 
mkdir -p /gentoo/etc/portage/package.use 
ADD https://www.pentoo.ch/isos/latest-iso-symlinks/pentoo-full-amd64-hardened-latest.iso /pentootmp 
RUN 7z x  /pentootmp/pentoo-full-amd64-hardened-latest.iso /pentootmp 
## unpack ##
RUN cd /gentoo  && tar --lzma -xvf *.lzm 
## cleanup 
RUN unsquashfs -f -d /gentoo /pentootmp/image.squashfs  && rm /gentoo/image.squashfs 

WORKDIR /
COPY --from=builder /gentoo/ /
CMD ["/bin/bash"]
RUN emerge --
