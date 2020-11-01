#!/usr/bin/env bash
echo -e "Configuring ${WORKINGDIR}/utserver.conf\n"
sed -i "s=\$UI_PORT=$UI_PORT=g" ${WORKINGDIR}/utserver.conf
sed -i "s=\$COMPLETED_FOLDER=$COMPLETED_FOLDER=g" ${WORKINGDIR}/utserver.conf
sed -i "s=\${AUTOLOAD}=${AUTOLOAD}=g" ${WORKINGDIR}/utserver.conf

echo -e "Starting utorrent server\n"
./utserver -settingspath ${WORKINGDIR} -configfile ${WORKINGDIR}/utserver.conf -logfile ${LOG_FOLDER}/utserver.log
