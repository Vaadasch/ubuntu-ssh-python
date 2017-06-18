FROM ubuntu:16.04

## PYTHON
RUN add-apt-repository -y ppa:jonathonf/python-3.6

RUN apt-get update

RUN apt-get -y  install python3.6


## SSHD
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22


CMD    ["/usr/sbin/sshd", "-D"]
