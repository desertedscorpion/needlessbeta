FROM ninthgrimmercury/needlessbeta
RUN dnf install --assumeyes httpd && systemctl enable httpd.service
EXPOSE 80
CMD ["/usr/sbin/init"]