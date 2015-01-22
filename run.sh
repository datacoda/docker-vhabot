#!/bin/sh

# Write out the configuration file

cat >/app/vhabot/config.xml <<EOF
<?xml version="1.0"?>
<Configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Core>
    <CentralServer>central.vhabot.net</CentralServer>
    <CentralAccount />
    <CentralPassword />
    <ConfigPath>config</ConfigPath>
    <PluginsPath>plugins</PluginsPath>
    <SkinsPath>skins</SkinsPath>
    <CachePath>xmlcache</CachePath>
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

exec /usr/bin/mono /app/vhabot/VhaBot.exe
