#!/usr/bin/env bash

API_URL='https://slack.com/api/files.upload'
SLACK_TOKEN=$(cat .config | grep SlackToken | sed "s/SlackToken://")
CHANNEL=$(cat .config | grep SlackChannel | sed "s/SlackChannel://")
FILENAME="$1"
SHORT_FILENAME=$(basename ${FILENAME})

eval curl $CURL_OPTS \
  --form-string channels=${CHANNEL} \
  -F file=@${FILENAME} \
  -F filename=${SHORT_FILENAME} \
  -F token=${SLACK_TOKEN} \
  ${API_URL}

exit 0
