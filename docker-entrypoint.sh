#!/bin/bash

# Verify inputs are provided
if [ -z "$AO_USER" ]; then
  echo "Env varaible AO_USER needs to be defined"
  exit 1
fi

if [ -z "$AO_PASS" ]; then
  echo "Env varaible AO_PASS needs to be defined"
  exit 1
fi

if [ -z "$VHABOT_CHARACTER" ]; then
  echo "Env varaible VHABOT_CHARACTER needs to be defined"
  exit 1
fi

if [ -z "$VHABOT_ADMIN" ]; then
  echo "Env varaible VHABOT_ADMIN needs to be defined"
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
    <Account>${AO_USER}</Account>
    <Password>${AO_PASS}</Password>
    <Character>${VHABOT_CHARACTER}</Character>
    <Admin>${VHABOT_ADMIN}</Admin>
    <Dimension>${VHABOT_DIMENSION:-RubiKa}</Dimension>
    <Enabled>true</Enabled>
    <Master>false</Master>
  </Bot>
</Configuration>
EOF

chmod 644 /etc/vhabot/config.xml

# Fix permissions on any attached volumes
chown vhabot.vhabot -R /var/lib/vhabot/config.d
chown vhabot.vhabot -R /var/lib/vhabot/xmlcache

# Drop privilege to vhabot.

function finish {
    echo "Stopped bot $VHABOT_CHARACTER:$VHABOT_DIMENSION"
}
trap finish EXIT

echo "Starting bot ${VHABOT_CHARACTER}@${VHABOT_DIMENSION}"
su -m vhabot -c "/usr/bin/mono /opt/vhabot/VhaBot.exe /etc/vhabot/config.xml"
