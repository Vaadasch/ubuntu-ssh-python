FROM ubuntu:16.04

RUN apt-get update

## PYTHON
RUN apt-get install -y build-essential checkinstall

RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

RUN wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz

RUN tar xvf Python-3.6.0.tar.xz && cd Python-3.6.0

RUN ./configure

RUN make altinstall


## SSHD
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22


CMD    ["/usr/sbin/sshd", "-D"]
