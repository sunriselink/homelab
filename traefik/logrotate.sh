#!/usr/bin/env bash

set -e

if [[ "${EUID}" -ne 0 ]]; then
    echo "This script must be run with sudo or as root"
    exit 1
fi

filepath="/etc/logrotate.d/homelab.traefik"
traefik_dir=$(dirname "$(realpath "$0")")

cat > $filepath <<EOF
$traefik_dir/logs/*.log {
    daily
    minsize 10M
    rotate 10
    missingok
    notifempty
    postrotate
        docker kill --signal="USR1" traefik
    endscript
}
EOF

echo "Created $filepath"
