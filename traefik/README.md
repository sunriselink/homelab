# Traefik

> Don't forget to change all occurrences of "my-service" to the name of your service (including labels)

## Default settings for reverse proxy activation

```yaml
services:
  my-service:
    labels:
      traefik.enable: true
```

Service will be available at `https://my-service.{ROOT_DOMAIN}` on the internal network only.

## Publish the service to an external network

```yaml
services:
  my-service:
    labels:
      traefik.enable: true
      traefik.http.routers.my-service.entrypoints: local-secure,external-secure
```

## Change default service port

> If a container exposes a single port, then Traefik uses this port.
>
> If a container exposes multiple ports, then Traefik uses the lowest port. E.g. if 80 and 8080 are exposed, Traefik will use 80.

```yaml
services:
  my-service:
    labels:
      traefik.enable: true
      traefik.http.services.my-service.loadbalancer.server.port: 8080
```

## Change host name

By default, docker service name is used as the host name.

```yaml
services:
  my-super-duper-service:
    labels:
      traefik.enable: true
      traefik.custom.host: my-service
```

Service will be available at `https://my-service.{ROOT_DOMAIN}` instead of `https://my-super-duper-service.{ROOT_DOMAIN}`. For more details see `defaultRule` option in [traefik settings](./docker-compose.yml).
