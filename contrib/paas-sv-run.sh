#!/bin/bash

# if all of the reader nodes die, kill runsv causing the container to exit
if [[ "$USE_MULTICORE_READONLY" ]]; then
  ps ax | grep read-only
  if [[ ! $? -eq 0 ]]; then
    RUN_SV_PID=`ps ax | grep 'runsv /etc/service/steemd' | grep -o '^[ ]*[0-9]*'`
    kill -9 $RUN_SV_PID
  fi
fi

# if the writer node dies, kill runsv causing the container to exit
ps ax | grep p2p-endpoint
if [[ ! $? -eq 0 ]]; then
  RUN_SV_PID=`ps ax | grep 'runsv /etc/service/steemd' | grep -o '^[ ]*[0-9]*'`
  kill -9 $RUN_SV_PID
fi

# check on this every 1 second
sleep 1
