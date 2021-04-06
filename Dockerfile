FROM alpine

RUN apk --no-cache add openssh-client openssh-server \
  && /usr/bin/ssh-keygen -A \
  && adduser -D -h /home/jump -s /bin/ash jump \
  && passwd -u jump

COPY entrypoint.sh /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
CMD "/usr/sbin/sshd -D -E /dev/stderr -o PermitTunnel=yes -o AllowTcpForwarding=yes -o PermitOpen=\"$AUTHORIZED_DESTINATIONS\" -e"