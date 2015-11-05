#!/bin/bash

# Verify inputs are provided
if [ -z "$LOGIN" ]; then
  echo "Env varaible LOGIN needs to be defined"
  exit 1
fi

if [ -z "$PASS" ]; then
  echo "Env varaible PASS needs to be defined"
  exit 1
fi

if [ -z "$VHABOT" ]; then
  echo "Env varaible VHABOT needs to be defined"
  exit 1
fi

if [ -z "$ADMIN" ]; then
  echo "Env varaible ADMIN needs to be defined"
  exit 1
fi

# Write out the configuration file
mkdir /etc/vhabot -p
cat >/etc/vhabot/config.xml <<EOF
<?xml version="1.0"?>
<Configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Core>
    <CentralServer>central.vhabot.net</CentralServer>
    <CentralAccount />
    <CentralPassword />
    <ConfigPath>/var/lib/vhabot/config.d</ConfigPath>
    <PluginsPath>plugins</PluginsPath>
    <SkinsPath>skins</SkinsPath>
    <CachePath>/var/lib/vhabot/xmlcache</CachePath>
    <Debug>false</Debug>
  </Core>
  <Bot>
    <Account>${LOGIN}</Account>
    <Password>${PASS}</Password>
    <Character>${VHABOT}</Character>
    <Admin>${ADMIN}</Admin>
    <Dimension>${DIMENSION:-RubiKa}</Dimension>
    <Enabled>true</Enabled>
    <Master>false</Master>
  </Bot>
</Configuration>
EOF

chmod 644 /etc/vhabot/config.xml

# Fix permissions on any attached volumes
chown vhabot.vhabot -R /var/lib/vhabot
su -m vhabot -c "mkdir -p /var/lib/vhabot/config.d"
su -m vhabot -c "mkdir -p /var/lib/vhabot/xmlcache"

# Drop privilege to vhabot.

function finish {
    echo "Stopped bot $VHABOT:$DIMENSION"
}
trap finish EXIT

echo "Starting bot ${VHABOT}@${DIMENSION}"
su -m vhabot -c "/usr/bin/mono /opt/vhabot/VhaBot.exe /etc/vhabot/config.xml"
