#!/bin/bash

APP="falcon-alarm"
WAIT_SERVICE_READY=10

check_service()
{
  status=$(bash -i $WORKDIR/control status)
  echo $status | grep -q "stoped"
  if [ $? -eq 0 ] ; then
    return 1
  else
    return 0
  fi
}

cp $CONFIGDIR/$CONFIGFILE $WORKDIR

bash -i $WORKDIR/control restart
while sleep $WAIT_SERVICE_READY; do
  check_service
  if [ $? -eq 1 ] ; then
    echo "$APP exited"
    exit 1
  fi
done
