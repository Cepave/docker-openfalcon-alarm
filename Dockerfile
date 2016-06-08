FROM alpine:3.4

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/alarm PACKFILE=falcon-alarm.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json

# Volume
VOLUME $CONFIGDIR $WORKDIR

# Install Open-Falcon Alarm Component
COPY $CONFIGFILE $CONFIGDIR/
ADD $PACKFILE $WORKDIR

WORKDIR $WORKDIR
COPY run.sh $WORKDIR

# Set timezone & bash
# Set alias in the case of user want to execute control in their terminal
RUN \
  apk add --update tzdata bash \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && apk del tzdata \
  && rm -rf /var/cache/apk/* \
  && echo "alias ps='pstree'" > ~/.bashrc

# Port
EXPOSE 9912

# Start
CMD ["bash", "run.sh"]

