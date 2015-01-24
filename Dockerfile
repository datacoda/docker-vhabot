FROM phusion/baseimage:0.9.16
MAINTAINER Ted Chen <ted@nephilagraphic.com>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN \
    apt-get update && \
    apt-get install -y \
        bash nano wget unzip \
        mono-runtime libmono-corlib2.0-cil libmono-system-runtime2.0-cil mono-gmcs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Change if older version no longer exists.
ENV VHABOT_VERSION 0.7.12

VOLUME /var/lib/vhabot/config.d
VOLUME /var/lib/vhabot/xmlcache

RUN \
    wget https://bitbucket.org/Llie/llie_vhabot/downloads/VhaBot_${VHABOT_VERSION}_LE_mono.zip && \
    unzip VhaBot_*_LE_mono.zip -d /opt && \
    rm VhaBot_*_LE_mono.zip && \
    ln -s /opt/VhaBot_${VHABOT_VERSION}_LE /opt/vhabot

# Exposed Configuration Variables
ENV \
    AO_USER=MyUser \
    AO_PASS=MyPassword \
    VHABOT_ADMIN=GameCharAdmin \
    VHABOT_CHARACTER=GameChar \
    VHABOT_DIMENSION=RubiKa

# Configure service
RUN \
    mkdir /etc/service/vhabot -p && \
    mkdir /etc/my_init.d -p

COPY vhabot_config.sh /etc/my_init.d/vhabot_config.sh
COPY vhabot.sh /etc/service/vhabot/run

# Secure permissions
RUN \
    useradd -u 999 vhabot && \
    chmod 775 /etc/my_init.d/vhabot_config.sh && \
    chmod 775 /etc/service/vhabot/run && \
    chown vhabot.vhabot -R /opt/vhabot/data

# Patch this for now
COPY patch/VhaBot.exe /opt/vhabot/VhaBot.exe

# Clean up when done
RUN rm -rf /tmp/* /var/tmp/*
