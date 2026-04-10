#!/bin/bash

power_state=$1
telegram_endpoint="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
icon="🔴"

if [[ "$power_state" == "up" ]]; then
    icon="✅"
fi

message="$icon NAS power state: $power_state"

send_message() {
    curl -fsS -m 30 -o /dev/null \
        -d chat_id=$TELEGRAM_CHAT_ID \
        -d text="$message" \
        $telegram_endpoint
}

attempt=0
max_attempts=5

until send_message || [[ $attempt -ge $max_attempts ]]; do
    ((attempt++))
    sleep 2
done

if [[ $attempt -ge $max_attempts ]]; then
    exit 255
fi
