#!/bin/sh

# Drop privilege to vhabot
logger "Starting Vhabot"
exec /sbin/setuser vhabot /usr/bin/mono /app/vhabot/VhaBot.exe /app/config.xml

