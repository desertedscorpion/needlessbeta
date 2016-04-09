FROM fedora:23
MAINTAINER “Emory Merryman” <emory.merryman+KsumQQd4h10X24pa@gmail.com>
ENV container docker
RUN dnf install --assumeyes git && mkdir --parents /srv/rpm/desertedscorpion && git -C /srv/rpm/desertedscorpion clone https://github.com/desertedscorpion/hollowmoon.git
COPY venusbeacon.repo /etc/yum.repos.d
RUN dnf --assumeyes update; dnf clean all
RUN dnf --assumeyes install systemd initscripts; dnf clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]

