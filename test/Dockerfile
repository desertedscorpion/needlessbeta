FROM ninthgrimmercury/needlessbeta
RUN dnf install --assumeyes httpd && systemctl enable httpd.service
RUN chmod 0600 /root/.ssh/authorized_keys
EXPOSE 80
CMD ["/usr/sbin/init"]