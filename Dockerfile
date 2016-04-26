FROM taf7lwappqystqp4u7wjsqkdc7dquw/easternmoose
MAINTAINER “Emory Merryman” <emory.merryman+KsumQQd4h10X24pa@gmail.com>
ENV container docker
RUN dnf update --assumeyes && dnf --assumeyes install systemd initscripts && dnf update --assumeyes && dnf clean all && \
(cd /lib/systemd/system/sysinit.target.wants/ && for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/* &&\
rm -f /etc/systemd/system/*.wants/* && \
rm -f /lib/systemd/system/local-fs.target.wants/* && \
rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
rm -f /lib/systemd/system/basic.target.wants/* &&\
rm -f /lib/systemd/system/anaconda.target.wants/*
VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]

