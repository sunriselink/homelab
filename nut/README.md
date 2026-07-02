# PeaNUT

## Add server

Go to `https://peanut.{ROOT_DOMAIN}/settings`

- Server Address: `host.docker.internal`
- Port: `3493` (by default)

Example of `/etc/nut/upsd.conf` settings for access from a container

```
LISTEN 0.0.0.0 3493
```

It's not very good to do this, but it didn't work for me any other way
