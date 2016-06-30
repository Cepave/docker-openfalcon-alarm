FROM alpine:3.4

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/alarm PACKFILE=falcon-alarm.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json

# Set timezone, bash, config dir
# Set alias in the case of user want to execute control in their terminal
RUN \
  apk add --no-cache tzdata bash \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && echo "alias ps='pstree'" > ~/.bashrc \
  && mkdir -p $CONFIGDIR

# Install Open-Falcon Alarm Component
COPY $CONFIGFILE $CONFIGDIR/
ADD $PACKFILE $WORKDIR
RUN ln -snf $CONFIGDIR/$CONFIGFILE $WORKDIR/$CONFIGFILE

WORKDIR $WORKDIR
COPY run.sh $WORKDIR

# Port
EXPOSE 9912

# Start
CMD ["bash", "run.sh"]

