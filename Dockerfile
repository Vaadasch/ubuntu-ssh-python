FROM ubuntu:16.04

## PYTHON
RUN apt-get install -y software-properties-common python-software-properties

## SSHD
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22


CMD    ["/usr/sbin/sshd", "-D"]
