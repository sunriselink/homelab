# My NAS stack

## First steps

- Create a `nas` user (recommended)
- Add current user to `nas` group (recommended)
- Create `global.env` file from `global.env.example` and fill missing variables
- Create `.env` files from `.env.example` for each stack and fill missing variables
- Create Network for Reverse Proxy via command `docker network create proxy`
- Set up port forwarding on your router
    - `:80 -> <nas ip>:81`
    - `:443 -> <nas ip>:444`
- Set up static DNS on your router
    - `${ROOT_DOMAIN} -> <nas ip>`
    - `*.${ROOT_DOMAIN} -> <nas ip>`

## Container management

### Local

```sh
./docker-compose-wrapper.sh STACK_NAME COMPOSE_COMMANDS
```

### OpenMediaVault

Go to `Services -> Compose -> Files` (`Edit global environment file` button) and place all from `global.env` into text field.

### Portainer

Run Portainer via command

```sh
./docker-compose-wrapper.sh container-management/portainer up -d
```

`global.env` file will need to be loaded into Portainer for each stack (unfortunately). See https://github.com/orgs/portainer/discussions/9867

### Dockge

Run Dockge via command

```sh
./docker-compose-wrapper.sh container-management/dockge up -d
```

For fix "exited" status just run script

```sh
./container-management/dockge/fix-exited-status.sh
```

See https://github.com/louislam/dockge/issues/177

When file `global.env` changes, restart Dockge container

## More information

### qBittorrent

Default user

```
Username: admin
Password: <view container logs>
```

Settings
1. WebUI > Use alternative WebUI: checked
2. WebUI > Files location: `/vuetorrent`
3. Downloads > Default Save Path: `/data/downloads` (important)

### File Browser

Default user

```
Username: admin
Password: admin
```
