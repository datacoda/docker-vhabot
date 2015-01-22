#!/bin/sh

# Write out the configuration file
echo "Configuring Vhabot with Environment Variables"

cat >/app/config.xml <<EOF
<?xml version="1.0"?>
<Configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Core>
    <CentralServer>central.vhabot.net</CentralServer>
    <CentralAccount />
    <CentralPassword />
    <ConfigPath>/app/data/config</ConfigPath>
    <PluginsPath>plugins</PluginsPath>
    <SkinsPath>skins</SkinsPath>
    <CachePath>/app/data/xmlcache</CachePath>
    <Debug>false</Debug>
  </Core>
  <Bot>
    <Account>${AO_USER}</Account>
    <Password>${AO_PASS}</Password>
    <Character>${VHABOT_CHARACTER}</Character>
    <Admin>${VHABOT_ADMIN}</Admin>
    <Dimension>${VHABOT_DIMENSION}</Dimension>
    <Enabled>true</Enabled>
    <Master>false</Master>
  </Bot>
</Configuration>
EOF

chmod 644 /app/config.xml

# Drop privilege to vhabot
echo "Starting Vhabot"
exec su - vhabot -c "HOME='/app' /usr/bin/mono /app/vhabot/VhaBot.exe /app/config.xml"
