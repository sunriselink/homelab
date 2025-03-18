# My NAS stack

## First steps

- Create a `nas` user (recommended)
- Add current user to `nas` group (recommended)
- Create `global.env` file from `global.env.example` and fill missing variables
- Create `.env` files from `.env.example` for each stack and fill missing variables
- Create Network for Reverse Proxy via command `docker network create proxy`

## Container management

### Local

```sh
./docker-compose-wrapper.sh STACK_NAME COMPOSE_COMMANDS
```

### OpenMediaVault

Go to `Services -> Compose -> Files` (`Edit global environment file` button) and place all from `global.env` into text field.

### Portainer

`global.env` file will need to be loaded into Portainer for each stack (unfortunately).

## Default users

### Nginx Proxy Manager

```
Email: admin@example.com
Password: changeme
```
