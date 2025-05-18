FROM --platform=linux/arm64/v8 ubuntu:18.04

LABEL MANTAINER: vincenzo.man@gmail.com

ENV COMPLETED_FOLDER /var/torrent/completed
ENV AUTOLOAD /var/utorrent/autoload
ENV LOG_FOLDER /var/log/utorrent

ENV WORKINGDIR /opt/utorrent-server-alpha-v3_3

ENV UI_PORT 8080


WORKDIR ${WORKINGDIR}
COPY conf/utserver.conf ${WORKINGDIR}/utserver.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apt-get update; apt-get install -y nano wget; apt-get install -y libssl1.0.0 libssl-dev; wget http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04 -O utserver.tar.gz; tar xvf utserver.tar.gz -C /opt/; \
    echo 'alias ll="ls -al"' >> ~/.bashrc; chmod 755 /docker-entrypoint.sh



VOLUME [ "${COMPLETED_FOLDER}", "${AUTOLOAD}", "${LOG_FOLDER}"]

EXPOSE ${UI_PORT}


CMD ["/docker-entrypoint.sh"]