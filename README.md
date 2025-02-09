# My NAS stack

## First steps

- Create a `nas` user
- Add current user to `nas` group
- Fill missing variables in `global.env`

Or for debugging execute

```sh
source .debugrc
```

## Portainer

```sh
./docker-compose-wrapper.sh portainer up -d
```

## Jellyfin

```sh
./docker-compose-wrapper.sh jellyfin up -d
```

## Nextcloud

```sh
sudo -E bash mknasdir.sh    \
    nextcloud/config        \
    nextcloud/custom_apps   \
    nextcloud/data          \
    nextcloud/postgres_data \
    nextcloud/themes

./docker-compose-wrapper.sh nextcloud up -d
```

## Audiobookshelf

```sh
sudo -E bash mknasdir.sh    \
    audiobookshelf/config   \
    audiobookshelf/metadata

./docker-compose-wrapper.sh audiobookshelf up -d
```
