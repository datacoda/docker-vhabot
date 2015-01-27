#!/bin/sh

set -e

# Write out the configuration file
echo "Configuring Vhabot with Environment Variables"

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