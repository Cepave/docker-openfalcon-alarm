FROM alpine:3.4

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/alarm PACKFILE=falcon-alarm.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json

# Volume
VOLUME $CONFIGDIR $WORKDIR

# Install Open-Falcon Alarm Component
COPY $CONFIGFILE $CONFIGDIR/
ADD $PACKFILE $WORKDIR

WORKDIR /root
COPY run.sh ./

RUN \
  apk add --update bash && \
  echo "alias ps='pstree'" > ~/.bashrc && \
  rm -rf /var/cache/apk/*

# Port
EXPOSE 9912

# Start
CMD ["./run.sh"]

