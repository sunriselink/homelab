# homelab-init

Docker image for initializing shared environment resources before starting application containers.

**Image:**

```bash
localhost/homelab-init:v2
```

## Built-in Commands

### create-dirs

Creates one or more directories.

- Owner: `NAS_UID:NAS_GID`
- Permissions: `770`

Example:

```yaml
services:
  init:
    image: localhost/homelab-init:v2
    pull_policy: never
    entrypoint: create-dirs
    environment:
      NAS_UID: ${NAS_UID:?}
      NAS_GID: ${NAS_GID:?}
    volumes:
      - ./:/tmp/my-service
    command:
      - /tmp/my-service/data
      - /tmp/my-service/config

  my-service:
    user: ${NAS_UID:?}:${NAS_GID:?}
    volumes:
      - ./data:/data
      - ./config:/config
    depends_on:
      init:
        condition: service_completed_successfully
```

---

### render-env

Renders a template file by replacing environment variables.

- Owner of output file: `NAS_UID:NAS_GID`
- Permissions: `660`

Arguments:

1. Template file path
2. Output file path

Example:

```yaml
services:
  init:
    image: localhost/homelab-init:v2
    pull_policy: never
    entrypoint: render-env
    environment:
      NAS_UID: ${NAS_UID:?}
      NAS_GID: ${NAS_GID:?}
      APP_HOST: example.com
      APP_PORT: 8080
    volumes:
      - ./:/tmp/my-service
    command:
      - /tmp/my-service/app.tpl.conf
      - /tmp/my-service/config/app.conf

  my-service:
    user: ${NAS_UID:?}:${NAS_GID:?}
    volumes:
      - ./config:/config
    depends_on:
      init:
        condition: service_completed_successfully
```

---

### wait-for-container

Waits until all specified containers are in `running` or `healthy` state.

> Requires Docker socket to be mounted into the container.

Example:

```yaml
services:
  init:
    image: localhost/homelab-init:v2
    pull_policy: never
    entrypoint: wait-for-container
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
    command:
      - apprise
      - authelia
      - traefik

  my-service:
    depends_on:
      init:
        condition: service_completed_successfully
```
