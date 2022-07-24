from debian:buster-slim

RUN apt-get update && apt-get install -y openssh-server sudo nfs-common nano && apt-get autoclean
RUN mkdir /run/sshd
RUN groupadd baseusers
RUN echo "%baseusers ALL = (root) NOPASSWD: ALL" >> /etc/sudoers

CMD /bin/sh -c '/usr/sbin/sshd -D -e -p 22'
