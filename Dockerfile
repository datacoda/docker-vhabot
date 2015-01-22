FROM phusion/baseimage
MAINTAINER Ted Chen <ted@nephilagraphic.com>

ENV VHABOT_VERSION 0.7.12

RUN apt-get update && apt-get install -y mono-runtime libmono-corlib2.0-cil libmono-system-runtime2.0-cil mono-gmcs unzip wget

RUN \
  wget https://bitbucket.org/Llie/llie_vhabot/downloads/VhaBot_${VHABOT_VERSION}_LE_mono.zip && \
  unzip VhaBot_*_LE_mono.zip -d /app && \
  rm VhaBot_*_LE_mono.zip && \
  ln -s /app/VhaBot_${VHABOT_VERSION}_LE /app/vhabot

# Exposed ENV
ENV AO_USER=MyUser \
    AO_PASS=MyPassword \
    VHABOT_ADMIN=GameCharAdmin \
    VHABOT_CHARACTER=GameChar \
    VHABOT_DIMENSION=Rubika

# Add config startup script
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Patch this for now
COPY patch/VhaBot.exe /app/vhabot/VhaBot.exe

CMD ["/run.sh"]
