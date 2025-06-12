# My NAS stack

## First steps

- Create a `nas` user (recommended)
- Add current user to `nas` group (recommended)
- Create `global.env` file from `global.env.example` and fill missing variables
- Create `.env` files from `.env.example` for each stack and fill missing variables
- Set up port forwarding on your router
  - `:80 -> <nas ip>:81`
  - `:443 -> <nas ip>:444`
- Set up static DNS on your router
  - `${ROOT_DOMAIN} -> <nas ip>`
  - `*.${ROOT_DOMAIN} -> <nas ip>`

Create required networks

```sh
docker network create proxy --opt com.docker.network.bridge.name=br-proxy
docker network create database --opt com.docker.network.bridge.name=br-database
docker network create readonly-docker-socket --opt com.docker.network.bridge.name=br-sock_ro
docker network create admin-docker-socket --opt com.docker.network.bridge.name=br-sock_admin
```

Run Docker Socket Proxy

```sh
./compose.sh .admin/docker-socket up -d
```

## Global environment variables (`global.env`)

| Variable name        | Description                    | Example or command  |
| -------------------- | ------------------------------ | ------------------- |
| `NAS_UID`            | NAS user PUID                  | `id -u nas`         |
| `NAS_GID`            | NAS user PGID                  | `id -g nas`         |
| `TZ`                 | Current timezone               | `cat /etc/timezone` |
| `PATH_TO_FILES`      | Full path to user files        | /mnt/data/files     |
| `PATH_TO_MEDIA`      | Full path to media files       | /mnt/data/media     |
| `ROOT_DOMAIN`        | Root domain name               | my-nas.duckdns.org  |
| `DUCKDNS_SUBDOMAINS` | Subdomain for DuckDNS          | my-nas              |
| `DUCKDNS_TOKEN`      | Token from DuckDNS admin panel |                     |

## Container management

### Local

```sh
./compose.sh STACK_NAME COMPOSE_COMMANDS
```

### OpenMediaVault

Go to `Services -> Compose -> Files` (`Edit global environment file` button) and place all from `global.env` into text field.

### Dockge

Run Dockge via command

```sh
./compose.sh .admin/dockge up -d
```

For fix "exited" status just run script

```sh
./prune.sh
```

See https://github.com/louislam/dockge/issues/177

When file `global.env` changes, restart Dockge container
