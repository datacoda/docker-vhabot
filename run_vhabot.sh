#!/bin/bash

# Drop privilege to vhabot.
# Strip original embedded timestamp since we're using logger anyways.

function finish {
    echo "Stopped bot $VHABOT_CHARACTER:$VHABOT_DIMENSION"
    logger -t vhabot "Stopped bot $VHABOT_CHARACTER}:$VHABOT_DIMENSION"
}
trap finish EXIT

echo "Starting bot ${VHABOT_CHARACTER}@${VHABOT_DIMENSION:-RubiKa}"

logger -t vhabot "Starting bot ${VHABOT_CHARACTER}@${VHABOT_DIMENSION:-RubiKa}"

exec \
    /sbin/setuser vhabot \
    /usr/bin/mono /opt/vhabot/VhaBot.exe /etc/vhabot/config.xml 2>&1 | \
    sed --unbuffered -e 's/\[[0-9:]* [A|P]M\] //g' | \
    logger -t vhabot
