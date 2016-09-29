#!/bin/bash

# Build and deploy script for vhabot from source.
# Makes the project, copies the release versions to the approriate places

HG_OPTS=''
SOURCE_DIR=/usr/src/vhabot
DEPLOY_DIR=/opt/vhabot

if [ -n "${COMMIT_TAG}" ]; then
  echo Cloning specific source tag ${COMMIT_TAG}.
  HG_OPTS="-r ${COMMIT_TAG}"  
else
  echo Cloning most recent source.
fi

hg clone https://bitbucket.org/Llie/llie_vhabot ${HG_OPTS} ${SOURCE_DIR}

cd ${SOURCE_DIR}

# fixes casing in repo 2016-09-28
mv ${SOURCE_DIR}/AoLib/Net/eventdelegates.cs ${SOURCE_DIR}/AoLib/Net/EventDelegates.cs

make release

echo Creating directories
rm -rf ${DEPLOY_DIR}
mkdir ${DEPLOY_DIR}
mkdir ${DEPLOY_DIR}/plugins
mkdir ${DEPLOY_DIR}/data

echo Copying Assemblies
cp ${SOURCE_DIR}/AoLib/bin/Release/AoLib.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.API/bin/Release/VhaBot.API.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.API/bin/Release/Mono.Data.SqliteClient.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.API/bin/Release/sqlite3.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.Communication/bin/Release/VhaBot.Communication.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.Configuration/bin/Release/VhaBot.Configuration.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.ConfigurationTool/bin/Release/Configure.exe ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.Core/bin/Release/VhaBot.Core.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.CorePlugins/bin/Release/VhaBot.CorePlugins.dll ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot/bin/Release/VhaBot.exe ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.Shell/bin/Release/VhaBot.Shell.exe ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.Shell/bin/Release/VhaBot.Shell.exe.config ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.Lite/bin/Release/VhaBot.Lite.exe ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/VhaBot.Lite/bin/Release/VhaBot.Lite.exe.config ${DEPLOY_DIR}/
cp ${SOURCE_DIR}/Plugins.Default/*.cs ${DEPLOY_DIR}/plugins/
cp ${SOURCE_DIR}/Plugins.Default/*.dll ${DEPLOY_DIR}/plugins/
cp ${SOURCE_DIR}/Plugins.Llie/*.cs ${DEPLOY_DIR}/plugins/
cp ${SOURCE_DIR}/Plugins.Llie/*.dll ${DEPLOY_DIR}/plugins/
cp ${SOURCE_DIR}/Plugins.Raid/*.cs ${DEPLOY_DIR}/plugins/
cp ${SOURCE_DIR}/Plugins.Raid/*.dll ${DEPLOY_DIR}/plugins/
cp -r ${SOURCE_DIR}/Extra/* ${DEPLOY_DIR}/
cp -r ${SOURCE_DIR}/Extra/data/* ${DEPLOY_DIR}/data/


rm -rf /tmp/* /var/tmp/*