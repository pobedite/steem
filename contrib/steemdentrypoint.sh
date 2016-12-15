#!/bin/bash

# if we're not using PaaS mode then start steemd traditionally with sv to control it
if [[ ! "$USE_PAAS" ]]; then
  mkdir -p /etc/service/steemd
  cp /etc/steemd/steem-sv-start.sh /etc/service/steemd/run
  chmod +x /etc/service/steemd/run
  sv up /etc/service/steemd
else
  /usr/local/bin/startpaassteemd.sh
fi
