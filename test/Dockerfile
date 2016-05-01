FROM ninthgrimmercury/needlessbeta
RUN dnf install --assumeyes openssh-server && systemctl enable sshd.service && mkdir /root/.ssh && chmod 0700 /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/authorized_keys
EXPOSE 22
CMD ["/usr/sbin/init"]