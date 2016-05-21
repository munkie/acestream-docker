FROM ubuntu:12.04

ENV DEBIAN_FRONTEND=noninteractive
ENV uid 1000
ENV gid 1000

RUN apt-get -y update && apt-get install -y wget python-minimal python-setuptools supervisor net-tools

RUN wget -O - http://repo.acestream.org/keys/acestream.public.key | apt-key add -
RUN echo "deb http://repo.acestream.org/ubuntu/ precise main" > /etc/apt/sources.list.d/acestream.list
RUN apt-get -y update && apt-get install -y acestream-full

# clean up after installation
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

RUN adduser --disabled-password --gecos "" ace

COPY start.sh /root/
RUN chmod +x /root/start.sh

# Copy acestream-engine supervisor config
COPY acestream.conf /etc/supervisor/conf.d/acestream.conf
# Copy sqlite acestream db with already set age and gender
COPY torrentstream.sdb /root/.ACEStream/sqlite/torrentstream.sdb

ENTRYPOINT ["/root/start.sh"]
