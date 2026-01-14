#!/bin/sh

set -e

cat /app/alertmanager.yml                               \
    | sed "s/\$TELEGRAM_BOT_TOKEN/$TELEGRAM_BOT_TOKEN/" \
    | sed "s/\$TELEGRAM_CHAT_ID/$TELEGRAM_CHAT_ID/"     \
    > /app/config/alertmanager.yml

/bin/alertmanager $@
