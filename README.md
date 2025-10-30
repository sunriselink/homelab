# My Home Lab stack

## First steps

- Create `global.env` file from `global.env.example` and fill missing variables
- Create `.env` files from `.env.example` for each stack and fill missing variables
- Set up port forwarding on your router
  - `:80 -> <nas ip>:81`
  - `:443 -> <nas ip>:444`
- Set up static DNS on your router
  - `*.${ROOT_DOMAIN} -> <nas ip>`

Create required networks

```sh
docker network create proxy
docker network create database
docker network create readonly-docker-socket
docker network create admin-docker-socket
```

> You can override network name
>
> `docker network create proxy --opt com.docker.network.bridge.name=br-proxy`

Run Docker Socket Proxy

```sh
./compose.sh .admin/docker-socket up -d
```

## Container management

### Local

```sh
./compose.sh <stack_path> <compose_commands>
```

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

When file `global.env` changes, recreate Dockge container

## Manual updating stack

When the versions of Docker images have been changed in the stack (in docker-compose.yml or .dockerfile files), you need to run a command to download new images and rebuild custom versions of images

```sh
./update.sh <stack_path>
```
