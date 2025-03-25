#!/bin/sh

set -e

database_file=database/filebrowser.db

install -d -o $PUID -g $PGID -m 770 database
install -d -o $PUID -g $PGID -m 770 /tmp/media

if [ ! -e $database_file ]; then
    touch $database_file
    chown $PUID:$PGID $database_file
    chmod 770 $database_file
fi
