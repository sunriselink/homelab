# My Home Lab stack

## First steps

- Create `global.env` file from `global.env.example` and fill missing variables
  - To fill variable `ROOT_DOMAIN`, register your domain on https://dynu.com/
- Create `.env` files from `.env.example` for each stack that you need and fill missing variables
- Set up port forwarding on your router for external access to some service (if needed)
  - `:80 -> <nas ip>:81`
  - `:443 -> <nas ip>:444`
- Set up static DNS on your router
  - `*.${ROOT_DOMAIN} -> <nas ip>`

Build `homelab-init` image

```sh
./.admin/homelab-init/build.sh
```

## Increase your Docker IP space

To extend Docker’s available network ranges, configure daemon settings.

```sh
sudo nano /etc/docker/daemon.json
```

Add IP pools. For example:

```json
{
  "default-address-pools": [
    { "base": "172.20.0.0/16", "size": 24 },
    { "base": "172.21.0.0/16", "size": 24 }
  ]
}
```

Restart Docker

```sh
sudo service docker restart
```

If networks already exist in these ranges, you must either:
- remove them
- or choose different IP ranges in daemon.json

## Minimum set of services

> Before running any stack, please read `<stack-path>/README.md` file

```sh
# If you use adguard as primary DNS server
./compose.sh adguard up -d

# Docker Socket Proxy
./compose.sh .admin/docker-socket up -d

# Authelia (authentication server)
./compose.sh authelia up -d

# Crowdsec (firewall)
./compose.sh crowdsec up -d

# Traefik (reverse proxy)
./compose.sh traefik up -d
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

```sh
./compose.sh .admin/dockge up -d --force-recreate
```

## Manual updating stack

When the versions of Docker images have been changed in the stack (in docker-compose.yml or .dockerfile files), you need to run a command to download new images and rebuild custom versions of images

```sh
./update.sh <stack_path>
```

## Additional features

- [Logrotate configurations](./.admin/logrotate/)
