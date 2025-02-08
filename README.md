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
