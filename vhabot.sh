#!/bin/sh

# Drop privilege to vhabot.
# Strip original embedded timestamp since we're using logger anyways.

logger "Starting Vhabot"
exec \
    /sbin/setuser vhabot \
    /usr/bin/mono /opt/vhabot/VhaBot.exe /etc/vhabot/config.xml 2>&1 | \
    sed 's/\[[0-9:]* [A|P]M\] //' | logger -t vhabot
