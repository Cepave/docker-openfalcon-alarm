FROM alpine:3.4

MAINTAINER cheminlin@cepave.com

ENV WORKDIR=/home/alarm DOCKERDIR=docker/alpine PACKFILE=falcon-alarm.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json

# Set timezone, bash, config dir
# Set alias in the case of user want to execute control in their terminal
RUN \
  apk add --no-cache tzdata bash \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && echo "alias ps='pstree'" > ~/.bashrc \
  && mkdir -p $CONFIGDIR

# Install Open-Falcon Alarm Component
ADD $DOCKERDIR/$PACKFILE $WORKDIR
COPY src/$CONFIGFILE $CONFIGDIR/
RUN ln -sf $CONFIGDIR/$CONFIGFILE $WORKDIR/$CONFIGFILE

WORKDIR $WORKDIR
COPY $DOCKERDIR/run.sh $WORKDIR/

# Port
EXPOSE 9912

# Start
ENTRYPOINT ["/bin/bash"]
CMD ["run.sh"]
